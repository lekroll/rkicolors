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
library(extrafont)
library(maps)
library(mapdata)

## ---- eval=FALSE---------------------------------------------------------
#  myproxy <- Sys.getenv("http_proxy")
#  httr::set_config(httr::use_proxy(myproxy))
#  devtools::install_github("lekroll/rkicolors")

## ---- warning=FALSE------------------------------------------------------
library(rkicolors)

## ----  fig.height = 4, fig.width = 6, fig.align ="left"------------------
sampleplot <- ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Species)) +   geom_point() 
sampleplot

## ----   fig.height = 4, fig.width = 6, fig.align ="left"-----------------
sampleplot +  theme_rki() + scale_color_rki()

## ----  fig.height = 4, fig.width = 6, fig.align ="left"------------------
sampleplot +  theme_rki() + scale_color_rki("qualitative")

## ---- warning=FALSE------------------------------------------------------
# uncomment only on first run
# font_import(prompt = FALSE) 
# loadfonts() 
fonttable() %>% as.data.frame() %>% filter(grepl("Scala", FullName)) %>% select(FamilyName,FullName,Bold,Italic,Symbol)

## ----   fig.height = 4, fig.width = 6, fig.align ="left"-----------------
sampleplot +  
  theme_rki(base_family="ScalaSansLF-Regular", bold_family="ScalaSansLF-Bold", base_size = 10) + 
  scale_color_rki("qualitative")

## ----  fig.height = 1, fig.width = 6, fig.align ="left", echo=FALSE------
explot <- as.data.frame(cbind("x"=seq(1:128),"y"=1)) %>%
  ggplot(.,aes(x=x,y=y,fill=x)) + geom_bar(stat="identity",width=1) + 
  theme_rki_void(bold_family="ScalaSansLF-Bold") + guides(fill=FALSE)
for (rkicolorsheme in names(rkicolors::rki_palettes)) {
  myplot <- explot + geom_text(aes(x=20,y=.5, label=paste(rkicolorsheme)),size=4,hjust="left",color="white") + 
          scale_fill_rki(paste(rkicolorsheme), discrete = FALSE)
  print(myplot)
}

## ----  fig.height = 4, fig.width = 6, fig.align ="left"------------------
ggplot(iris, aes(y=Sepal.Width, x=Sepal.Length,color=Sepal.Width)) +   geom_jitter(size=3) +  guides(color=FALSE)+theme_rki(base_family = "ScalaSansLF-Regular",bold_family = "ScalaSansLF-Bold") + scale_color_rki("bluered",discrete=FALSE) + facet_grid(cols = vars(Species))

## ----fig.height = 4, fig.width = 6, fig.align ="left", warning=FALSE-----
worldmap.df <- map_data("world") %>% filter(region!="Antarctica")
map <- ggplot(data = worldmap.df) + 
  geom_polygon(aes(x = long, y = lat, group = group, fill="All"), color = "white") + 
  coord_fixed() +   guides(fill=FALSE)  + 
  theme_rki(base_family="ScalaSansLF-Regular", bold_family="ScalaSansLF-Bold", base_size = 10) + 
  scale_fill_rki()
map
map + theme_rki_void()

## ----   fig.height = 4, fig.width = 6, fig.align ="left"-----------------
theme_set(theme_rki(base_family="ScalaSansLF-Regular", bold_family="ScalaSansLF-Bold", base_size = 10))
sampleplot + scale_color_rki()

