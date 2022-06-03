# Load libraries ---------------------------------------------------------------

library(ggplot2)

# Prepare data -----------------------------------------------------------------

z=\(x,y,n)bitwAnd(bitwXor(x,y),bitwOr(x,y)%%n)>0

data <- expand.grid(x = 0:160, y = 0:192)

# Build plot -------------------------------------------------------------------

p <- ggplot(
  data = data,
  aes(x, y, fill = z(x, y, 19 + (x > y) * 18) + 2 * z(x, y, 13))) +
  geom_raster() +
  theme_void() +
  coord_fixed() +
  scale_fill_viridis_c(option = "D", guide = NULL) +
  theme(
    plot.background = element_rect(fill = "#FFFFFF", colour = "#FFFFFF"))

# Export to file ---------------------------------------------------------------

ggsave(here::here("img/bitwise_0001.png"), last_plot(),
       height = 10, width = 8, units = "cm", dpi = 600)