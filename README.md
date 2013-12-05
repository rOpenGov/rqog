# rQog-package

*Search, extract and format data from the Quality of Government Institute data*

Quotation form [ Quality of Governance institute website](http://www.qog.pol.gu.se/)

>The QoG Institute was founded in 2004 by Professor Bo Rothstein and Professor Sören Holmberg. It is an independent research institute within the Department of Political Science at the University of Gothenburg. We conduct and promote research on the causes, consequences and nature of Good Governance and the Quality of Government (QoG) - that is, trustworthy, reliable, impartial, uncorrupted and competent government institutions.

>The main objective of our research is to address the theoretical and empirical problem of how political institutions of high quality can be created and maintained. A second objective is to study the effects of Quality of Government on a number of policy areas, such as health, the environment, social policy, and poverty. We approach these problems from a variety of different theoretical and methodological angles.

**Quality of Government institute** provides data in five different data sets

1. [QoG Basic Data](http://www.qog.pol.gu.se/data/datadownloads/qogbasicdata/)
2. [QoG Standard Data](http://www.qog.pol.gu.se/data/datadownloads/qogstandarddata/)
3. [QoG Social Policy Data](http://www.qog.pol.gu.se/data/datadownloads/qogsocialpolicydata/)
4. [QoG Expert Survey Data](http://www.qog.pol.gu.se/data/datadownloads/qogexpertsurveydata/) 
5. [QoG EU Regional Data](http://www.qog.pol.gu.se/data/datadownloads/qogeuregionaldata/)

**rQog**-package provides access to **Basic** and **Standard** datasets through functions `getQogBasic()` and `getQogStandard()`. **Standard** data has all the same indicators  as in **Basic** data (143 variables) and an additional 585 indicators.

Quality of Government Institute provides codebooks for all datasets (see [Basic codebook](http://www.qogdata.pol.gu.se/codebook/codebook_basic_30aug13.pdf) and [Standard codebook](http://www.qogdata.pol.gu.se/codebook/codebook_standard_15may13.pdf)) and you should use the codebooks to find the indicator code you are interested in and pass it to either of two functions.

### STATA-package

*Christoph Thewes, from University of Potsdam* has already written a package for STATA users. [See details from QoG website](http://www.qog.pol.gu.se/data/dataextras/forstatausers/)


## Installation


```r
library(devtools)
install_github(repo = "rQog", username = "muuankarski")
library(rQog)
```


## Examples

### Basic Data

Basic data has a limited selection of most common indicators incluidng totally 143 variables. Below is an example on how to extract data on human development index and Democracy (Freedom House/Polity) index from BRIC-countries and plot it.


```r
library(rQog)
dat <- getQogBasic(country = c("Russia","China","India","Brazil"), # country,countries
              indicator=c("undp_hdi","fh_polity2")) # indicator(s)
library(ggplot2)
ggplot(dat, aes(x=year,y=value,color=cname)) + 
  geom_point() + geom_line() +
  geom_text(data=merge(dat,aggregate(year ~ cname, dat, max),
                     by=c("year","cname")),
          aes(x=year,y=value,label=cname),
          hjust=1,vjust=-1,size=3,alpha=.8) +
  facet_wrap(~indicator, scales="free") +
  theme(legend.position="none")
```



### Standard Data

Standard data includes a all the indicators 748 variables. Below is an example on how to extract data on *Environmental Performance Index*  and *Party of Chief Executive: How Long in Office* from BRIC-countries and plot it.



```r
library(rQog)
dat <- getQogStandard(country = c("Russia","China","India","Brazil"), # country,countries
              indicator=c("epi_epi","dpi_hlio")) # indicator(s)
library(ggplot2)
ggplot(dat, aes(x=year,y=value,color=cname)) + 
  geom_point() + geom_line() +
  geom_text(data=merge(dat,aggregate(year ~ cname, dat, max),
                     by=c("year","cname")),
          aes(x=year,y=value,label=cname),
          hjust=1,vjust=-1,size=3,alpha=.8) +
  facet_wrap(~indicator, scales="free") +
  theme(legend.position="none")
```



### Spatial visualisation of Quality of Government data

Here I'm downloading the whole world shapefile from www-mappinghacks.com. I'm taking a bit of a shortcut here as I'm converting the `SpatialPolygonDataFrame` right away into regular `data.frame` using `fortify`-function from **ggplot2**. Thereafter I extract the *Enviromental Performance Index* from **Standard** data and merge it with map data and plot whole world using mercator projetion. Grey color stands for missing data.



```r
download.file("http://www.mappinghacks.com/data/TM_WORLD_BORDERS-0.2.zip", destfile = "worldborders.zip")
# unzip to SpatialPolygonsDataFrame
unzip("worldborders.zip")
library(rgdal)
shape <- readOGR(dsn = "./", layer = "TM_WORLD_BORDERS-0.2")
# fortify the data
library(ggplot2)
shape$id <- rownames(shape@data)
map.points <- fortify(shape, region = "id")
map.df <- merge(map.points, shape, by = "id")
## laod the data with all countries
dat <- getQogStandard(country = "all", # country,countries
              indicator=c("epi_epi"),
                      year = 2008) # indicator(s)
# merge the datas using country names
map.df <- merge(map.df, dat, by.x = "NAME", by.y = "cname", all.x = TRUE)
# order the data for smooth plotting
map.df <- map.df[order(map.df$order), ]

library(ggplot2)
ggplot(map.df, aes(long,lat,group=group)) +
  geom_polygon(aes(fill=value)) +
  geom_polygon(data = map.df, aes(long,lat), 
               fill=NA, 
               color = "white",
               size=0.1) + # white borders
  scale_fill_gradient2(low="white", high="blue")+
    theme(legend.position="top") +
  labs(title=paste("Indicator mapped is ",
                    as.character(dat[1, "indicator"]),
                    sep=""))
```




