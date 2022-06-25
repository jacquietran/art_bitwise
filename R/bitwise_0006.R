# Load libraries ---------------------------------------------------------------

library(ggplot2)

# Prepare data -----------------------------------------------------------------

z=\(x,y,n)bitwAnd(bitwOr(x,y),bitwOr(x,y)%%n)>0

data <- expand.grid(x = 0:250, y = 0:250)

# Build plot -------------------------------------------------------------------

p <- ggplot(
  data = data,
  aes(x, y, fill = z(x, y, 20 + (x > y) * 12) + 5 * z(x, y, 18))) +
  geom_raster() +
  theme_void() +
  coord_fixed() +
  paletteer::scale_fill_paletteer_c("scico::lajolla") +
  theme(
    legend.position = "none",
    plot.background = element_rect(fill = "#ECE0D5", colour = "#ECE0D5"),
    plot.margin = margin(20,20,20,20, unit = "pt"))

# Export to file ---------------------------------------------------------------

ggsave(here::here("img/bitwise_0006.png"), last_plot(),
       height = 10, width = 10, units = "cm", dpi = 600)