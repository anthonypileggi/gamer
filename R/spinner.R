
#' Simple spinner animation
#' @param groups number of groups
#' @param nframes number of frames
#' @param fps frames per second
#' @export
spinner <- function(groups = 3, nframes = 100, fps = 10) {

  # spinner data (TODO: allow as input for customization)
  df <- tibble::tibble(name = LETTERS[1:groups], freq = rep(1, groups))

  dfs <- purrr::map2_df(c(1:nrow(df), 1), 1:(nrow(df) + 1), ~mutate(df, selected = .x, frame = .y))

  # TODO: how can we link first/last states in polar coordinates?

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
    gganimate::transition_states(frame, transition_length = 1, state_length = 0, wrap = FALSE)

  gganimate::animate(g, nframes = nframes, fps = fps)
}
