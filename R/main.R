#' RKI Theme based on theme_grey
#'
#' @param Define a base_size (Defaults to 12) and base_family for Fonts used (defaults to ggplot2's defaults)
#' @keywords theme
#' @export
#' @examples
#' ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Species)) +   geom_point() +  theme_rki()
#'

theme_rki <- function (base_size=12, base_family = "") {
  theme_grey() +
    theme(plot.margin = margin(.5, .5, .5, .5, "cm"),
          text=element_text(face="plain"),
          panel.grid.major.x = element_blank(),
          panel.grid.major.y = element_line(colour=  rgb(209/255,209/255,209/255)) ,
          panel.background = element_rect(fill=NA),
          strip.background = element_rect(fill=NA),
          strip.text = element_text(face="plain",  size = rel(1.1)),
          plot.title = element_text(size = rel(1.2)),
          axis.title = element_text(size = rel(1.1)),
          axis.title.x = element_text(vjust=-1),
          axis.title.y = element_text(vjust=2),
          axis.text =  element_text(colour="black", size = rel(1.0)),
          axis.line = element_line(colour="black", size = 0.3 ) ,
          axis.ticks.length = unit(.25, "cm") ,
          legend.key = element_blank(),
          legend.title = element_text(face="plain", size = rel(1.0)))
}


#' RKI Theme based on theme_grey
#'
#' @param Define a base_size (Defaults to 12) and base_family for Fonts used (defaults to ggplot2's defaults)
#' @keywords theme
#' @export
#' @examples
#' ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Species)) +   geom_point() +  theme_rki()
#'

theme_rki <- function (base_size=12, base_family = "", bold_family="") {
  theme_grey(base_size=base_size,base_family=base_family) +
    theme(plot.margin = margin(.5, .5, .5, .5, "cm"),
          text=element_text(face="plain"),
          panel.grid.major.x = element_blank(),
          panel.grid.major.y = element_line(colour=  rgb(209/255,209/255,209/255)) ,
          panel.background = element_rect(fill=NA),
          strip.background = element_rect(fill=NA),
          strip.text = element_text(family=bold_family, face="plain", size = rel(1.1)),
          plot.title = element_text(family=bold_family, face="plain", size = rel(1.2)),
          axis.title = element_text(family=bold_family, lineheight = 1.15, face="plain",  size = rel(1.1)),
          axis.text =  element_text(colour="black", size = rel(1.0)),
          axis.line = element_line(colour="black", size = 0.3 ) ,
          axis.ticks.length = unit(.25, "cm") ,
          legend.key = element_blank(),
          legend.title = element_text(family=bold_family, face="plain", size = rel(1.0)))
}

#' RKI Theme without axis and labels based on theme_rki() optimal suited to print maps.
#'
#' @param Define a base_size (Defaults to 12) and base_family for Fonts used (defaults to ggplot2's defaults)
#' @keywords theme
#' @export
#' @examples
#' ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Species)) +   geom_point() +  theme_rki_void()
#'

theme_rki_void <- function (base_size=12, base_family = "") {
  theme_rki() +
    theme(panel.grid.major.y = element_blank(),
          axis.title = element_blank(),
          axis.text =  element_blank(),
          axis.line = element_blank(),
          axis.ticks = element_blank())
}



# RKI colors
rki_colors <- c(
  `red`         = rgb(184/255,0/255,94/255),
  `green`       = rgb(94/255,184/255,0/255),
  `blue`        = rgb(0/255,94/255,184/255),
  `grey`        = rgb(103/255,103/255,103/255),
  `light grey`  =  rgb(209/255,209/255,209/255) ,
  `light blue`  =  rgb(178/255,206/255,234/255),
  `light green` =  rgb(206/255,234/255,178/255),
  `light red`   = rgb(234/255,178/255,206/255)
  )

# Function to access colors by Names
rki_cols <- function(...) {
  cols <- c(...)

  if (is.null(cols))
    return (rki_colors)

  rki_colors[cols]
}
#' @export
# Palette Definition
rki_palettes <- list(
  `main`        = rki_cols("blue", "light blue"),
  `green`       = rki_cols("green", "light green"),
  `red`         = rki_cols("red", "light red"),
  `grey`        = rki_cols("grey", "light grey"),
  `bluegreen`   = rki_cols("blue", "green"),
  `bluegrey`    = rki_cols("blue", "grey"),
  `bluered`     = rki_cols("blue", "red"),
  `qualitative` = rki_cols("blue", "green","red"),
  `all` = rki_cols("blue", "green","red","grey")
  )

# Palette Function
rki_pal <- function(palette = "main", reverse = FALSE, ...) {
  pal <- rki_palettes[[palette]]
  if (reverse) pal <- rev(pal)
  colorRampPalette(pal, ...)
}



#' RKI color scale for ggplot2 with different pallettes
#'
#' @param Options include palette (Defaults to "main" RKI Blue-Shades, with other options beeing "all", "qualitative")
#' @keywords custom_scale_color()
#' @export
#' @examples
#' ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Species)) +   geom_point() +  theme_rki() + scale_color_rki()
#'
#'
scale_color_rki <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- rki_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("colour", paste0("rki_", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}


#' RKI fill scale for ggplot2 with different pallettes
#'
#' @param Options include palette (Defaults to "main" RKI Blue-Shades, with other options beeing "all", "qualitative")
#' @keywords custom_scale_color()
#' @export
#' @examples
#' ggplot(iris, aes(x=Species,y=Sepal.Width, fill = Species)) +   geom_bar(stat = "summary", fun.y = "mean") +  theme_rki() + scale_fill_rki(
#'
#'
scale_fill_rki  <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- rki_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("fill", paste0("rki_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}
