explot <- as.data.frame(cbind("x"=seq(1:128),"y"=1)) %>%
  ggplot(.,aes(x=x,y=y,fill=x)) + geom_bar(stat="identity",width=1) +
           guides(fill=FALSE) + theme_void()
explot + scale_fill_rki()
for (rkicolorsheme in names(rki_palettes)) {
  print(paste(" ",rkicolorsheme))
  explot + ggtitle(paste(rkicolorsheme)) + scale_fill_rki(paste(rkicolorsheme), discrete = FALSE)
}

