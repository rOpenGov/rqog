library(shiny)
library(rqog)
library(dplyr)
library(tidyr)
library(shinycssloaders)
library(bslib)
library(metathis)
library(shinyWidgets)
library(glue)

valid_years <- 2016:as.integer(substr(Sys.Date(), 1, 4))
## get the names of all the data sets
dsets <- data(package = "rqog")$result[, c("Title", "Item")] %>% as_tibble()
val_dsets <- dsets$Item
names(val_dsets) <- gsub("Metadata for | Quality of Government institute", "", dsets$Title)
val_dsets < sort(names(val_dsets), decreasing = TRUE)

ui <- fluidPage(lang = "fi",
                title = "rqog browser",
                tags$head(tags$link(rel="shortcut icon", href="favicon.ico")),
                meta() %>% 
                  meta_description(description = "geofi-selain") %>% 
                  meta_social(
                    title = "rqog browser",
                    description = "rqog browser: browse quality of government data in browser",
                    url = "",
                    image = "rqog_browser.png",
                    image_alt = "An image for social media cards",
                    twitter_creator = "@muuankarski",
                    twitter_card_type = "summary_large_image",
                    twitter_site = "@muuankarski"
                  ),
                theme = bslib::bs_theme(bootswatch = "cosmo",
                                        # bg = "#0b3d91", fg = "white", primary = "#FCC780",
                                        base_font = font_google("PT Sans"),
                                        code_font = font_google("Space Mono")),
                tags$html(HTML('<a class="sr-only sr-only-focusable" href="#maincontent">Skip to main</a>')),
                tags$style(HTML("
      .navbar-xyz {
        background-color: rgb(255, 255, 255, .9);
        border-bottom: 1px solid rgb(55, 55, 55, .4);
      }
      #map {
    margin: auto;
  }")),
                tags$html(HTML('
    <nav class="navbar navbar-light sticky-top navbar-xyz">
      <a class="navbar-brand" role="brand" href = "https://ropengov.github.io/rqog/"><img src = "https://ropengov.github.io/rqog/reference/figures/logo.png" style = "height: 35px; padding-right: 0px;" alt = "Kompassi"></a>
      <div class = "lead">rqog browser</div>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Avaa valikko">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div role = "navigation" class="collapse navbar-collapse justify-content-between" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="https://ropengov.github.io/rqog/">rqog-package</a>
          </li>
                    <li class="nav-item">
            <a class="nav-link" href="http://ropengov.org/">ropengov.org</a>
          </li>

        </ul>
      </div>
  </nav>')),
                tags$html(HTML('<main id="maincontent">')),
                tags$h2("", id = "alku"),
                tags$div(class = "container",
                fluidRow(column(3, class = "well",
                                tags$p(class = "lead", "Metadata, Data availability and code snippets for Quality of Government Institute Data"), 
                    tags$p("This app is shipped with  ",
                           tags$a(href = "https://ropengov.github.io/rqog", 
                                  tags$code("rqog")),
                           "R-package. App allows you to quickly check ",tags$a(href = "https://www.gu.se/en/quality-government/qog-data", 
                                                                                     tags$code("The Quality of Government Institute")),
                           " metadata and completeness of variables and timeseries."),
                    tags$p("Analytical tools are available at ", tags$a(href = "https://www.gu.se/en/quality-government/qog-data/visualization-tools", "QoG-website"),"."),
                    tags$hr(),
                    tags$p("(C) Markus Kainu 2011-2022"),
                    tags$a(href = "https://github.com/rOpenGov/rqog/blob/master/inst/extras/rqog_app/app.R", 
                           tags$code("Source code at Github"))
                    ),
                    column(4,
                    selectInput("value_dataset",
                                "Pick dataset:",
                                choices = val_dsets,
                                selected = "2022 Standard Data - cross-sectional"),  
                    pickerInput('value_variable', 
                                   label = "Pick variable:", 
                                   choices = NULL, multiple = TRUE),
                    tags$p("Data preview requires internet connection and takes some time."),
                    tags$p("Data preview is meant for checking the completeness of data only. For obtaining data, open R and use the R-code on top right!", HTML("&#8599;")),
                    actionButton(inputId = "button", 
                                 label = "Preview data", 
                                 class="btn btn-outline-primary"
                    )
                    ),
                    column(5, 
                           tags$h4("R-code for obtaining the data"),
                           # tags$code("library(rqog)
                           #           library(shiny)"),
                           # ,downloadButton("download_code", "Lataa R-koodi"),
                           verbatimTextOutput("output_code")
                    )),
                tags$hr(),
                  fluidRow(column(5,
                                  tags$h4("Metadata"),
                                  tableOutput("meta_tbl")
                  ),
                                    column(7,
                                           tags$h4("Data preview")
                                           ,uiOutput("ui_availability_tbl")
                                    )
                  ),
                tags$div(style = "padding-bottom: 150px;")
                )
)


# Define server logic required to draw a histogram
server <- function(input, output, session) {
  
  
  observeEvent(input$value_dataset, {
    
    metad <- get(input$value_dataset)
    df_vars <- distinct(metad, code,name)
    val_vars <- df_vars$code
    names(val_vars) <- df_vars$name
    
    # updateSelectizeInput(session, inputId = 'value_variable', 
    #                      choices = val_vars, 
    #                      selected = val_vars[10], 
    #                      server = TRUE)
    updatePickerInput(session, inputId = 'value_variable', 
                      choices = val_vars, 
                      selected = val_vars[10], 
                      options = pickerOptions(liveSearch = TRUE, 
                                              actionsBox = TRUE)
                         # server = TRUE
                      )
    
    
    
  })

    output$meta_tbl <- renderTable({
      metad <- get(input$value_dataset)
      metad[metad$code %in% input$value_variable,]
    })

    funk <- eventReactive({
      input$button
    }, {
      datavalue <- input$value_dataset
      # datavalue <- "meta_basic_ts_2021"
      datavalue_nchar <- nchar(datavalue)
      val_year <- as.integer(substr(datavalue, datavalue_nchar-3, datavalue_nchar))
      # define data name
      if (grepl("basic", datavalue)){
        data_name <- "basic"
      } else if (grepl("std", datavalue)){
        data_name <- "standard"
      } else if (grepl("oecd", datavalue)){
        data_name <- "oecd"
      }
      # define data type
      if (grepl("ts", datavalue)){
        data_type <- "time-series"
      } else {
        data_type <- "cross-sectional"
      } 
      
      dtemp <- read_qog(which_data = data_name, data_type = data_type, year = val_year)
      if (data_type == "cross-sectional"){
        dtemp[,c("ccode","cname","version",input$value_variable)]
        # dtemp[,c("ccode","cname","version","atop_number","bci_bci")]
      } else {
        dtemp2 <- dtemp[,c("ccode","cname","year","version",input$value_variable)] 
        # pivot_longer(dtemp2, 
        #              names_to = "variable", 
        #              values_to = "value", 
        #              cols = 5:ncol(dtemp2)) %>% 
        #   na.omit() %>% 
        # pivot_wider(names_from = year, values_from = value) %>% 
        arrange(dtemp2, cname, year)
      }
      
      
    }, ignoreNULL = TRUE)
    
    output$availability_tbl <- renderTable({
      funk()
    })
    
    output$ui_availability_tbl <- renderUI({
      tagList(
        div(style='height:520px; overflow-y: auto; overflow-x: auto;',
            shinycssloaders::withSpinner(tableOutput("availability_tbl"))
        )
      )
    })
    
    
    create_code <- reactive({
      req(input$value_dataset)
      req(input$value_variable)
      
      datavalue <- input$value_dataset
      # datavalue <- "meta_basic_ts_2021"
      datavalue_nchar <- nchar(datavalue)
      val_year <- as.integer(substr(datavalue, datavalue_nchar-3, datavalue_nchar))
      # define data name
      if (grepl("basic", datavalue)){
        data_name <- "basic"
      } else if (grepl("std", datavalue)){
        data_name <- "standard"
      } else if (grepl("oecd", datavalue)){
        data_name <- "oecd"
      }
      # define data type
      if (grepl("ts", datavalue)){
        data_type <- "time-series"
        base_vars <- '"ccode","year","cname","version"'
      } else {
        data_type <- "cross-sectional"
        base_vars <- '"ccode","cname","version"'
      } 
      user_vars <- paste0(input$value_variable, collapse = '","')
      
      code <- glue('
      # remotes::install_github(""ropegov/rqog")
      library(rqog)
      df_qog <- read_qog(which_data = "{data_name}", 
                    data_type = "{data_type}", 
                    year = {val_year})
      df_qog_subset <- df_qog[,c({base_vars},
                                  "{user_vars}")]
      head(df_qog_subset)')
      return(code)
    })
    
    
    output$output_code <- renderText({
      
      create_code()
      
    })
    
    
}

# Run the application 
shinyApp(ui = ui, server = server)
