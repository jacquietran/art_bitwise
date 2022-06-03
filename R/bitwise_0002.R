# Load libraries ---------------------------------------------------------------

library(ggplot2)

# Prepare data -----------------------------------------------------------------

z=\(x,y,n)bitwAnd(bitwOr(x,y),bitwOr(x,y)%%n)>0

data <- expand.grid(x = 0:192, y = 0:192)

# Build plot -------------------------------------------------------------------

p <- ggplot(
  data = data,
  aes(x, y, fill = z(x, y, 9 + (x > y) * 18) + 8 * z(x, y, 13))) +
  geom_raster() +
  theme_void() +
  coord_fixed() +
  scale_fill_viridis_c(option = "B", guide = NULL) +
  theme(
    plot.background = element_rect(fill = "#FFFFFF", colour = "#FFFFFF"),
    plot.margin = margin(20,20,20,20, unit = "pt"))

# Export to file ---------------------------------------------------------------

ggsave(here::here("img/bitwise_0002.png"), last_plot(),
       height = 10, width = 10, units = "cm", dpi = 600)