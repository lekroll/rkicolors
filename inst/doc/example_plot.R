library("rkicolors")
library("ggplot2")
library("extrafont")
ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Species)) +
   geom_point() +
theme_rki(base_family="ScalaSansLF-Regular",
          bold_family="ScalaSansLF-Bold",
          base_size = 8) +
scale_color_rki()
ggsave("inst/doc/example_plot.png", dpi=300, width = 4, height=2.25)
