## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- warning=FALSE------------------------------------------------------
library(devtools)
library(httr)
library(ggplot2)
library(dplyr)

## ------------------------------------------------------------------------
myproxy <- Sys.getenv("http_proxy")
httr::set_config(httr::use_proxy(myproxy))
devtools::install_github("lekroll/rkicolors")

## ---- warning=FALSE------------------------------------------------------
library(rkicolors)

## ----  fig.cap = "Plot 1: Sample Application using iris dataset without customization", fig.height = 4, fig.width = 6, fig.align ="left"----
ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Species)) +   geom_point() +  theme_rki() + scale_color_rki()

## ----  fig.cap = "Plot 2: Sample Application with color customization", fig.height = 4, fig.width = 6, fig.align ="left"----
ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Species)) +   geom_point() +  theme_rki() + scale_color_rki("qualitative")

## ---- warning=FALSE------------------------------------------------------
library(extrafont)
# uncomment only on first run
# font_import(prompt = FALSE) 
# loadfonts() 
fonttable() %>% as.data.frame() %>% filter(grepl("Scala", FullName)) %>% select(FamilyName,FullName,Bold,Italic,Symbol)

## ----  fig.cap = "Plot 3: Sample Application with color customization and RKI Font", fig.height = 4, fig.width = 6, fig.align ="left"----
ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Species)) +   
  geom_point() +  
  theme_rki(base_family="ScalaSansLF-Regular", bold_family="ScalaSansLF-Bold", base_size = 10) + 
  scale_color_rki("qualitative")

## ----  fig.cap = "Plot 4: Sample Application with color customization and RKI Font", fig.height = 4, fig.width = 6, fig.align ="left"----
theme_set(theme_rki(base_family="ScalaSansLF-Regular", bold_family="ScalaSansLF-Bold", base_size = 10))
ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Species)) +   geom_point() + scale_color_rki()

## ----fig.height = 4, fig.width = 6, fig.align ="left", warning=FALSE-----
library(maps)
library(mapdata)
worldmap.df <- map_data("world2") %>% filter(region!="Antarctica")
map <- ggplot(data = worldmap.df) + 
  geom_polygon(aes(x = long, y = lat, group = group, fill="All"), color = "white") + 
  coord_fixed() +   guides(fill=FALSE)  + 
  theme_rki(base_family="ScalaSansLF-Regular", bold_family="ScalaSansLF-Bold", base_size = 10) + 
  scale_fill_rki()
map
map + theme_rki_void()

