
# Simple spinner animation
spinner <- function() {

  # spinner data (TODO: allow as input for customization)
  df <- tibble::tibble(name = LETTERS[1:3], freq = rep(1, 3))

  dfs <- purrr::map_df(1:nrow(df), ~mutate(df, selected = .x))
  # TODO: append first state to end so spinner loops!

  g <- ggplot(dfs) +
    geom_bar(
      aes(x = name, y = freq, fill = name),
      stat = "identity",
      width = 1
    ) +
    geom_segment(
      aes(x = selected, xend = selected, y = 0,  yend = .75),
      arrow = arrow(length = unit(1.0, "cm")),
      size = 2
    ) +
    coord_polar() +
    theme_void() +
    gganimate::transition_states(selected, transition_length = 1, state_length = 0, wrap = FALSE)

  gganimate::animate(g, nframes = 100, fps = 10)
}
