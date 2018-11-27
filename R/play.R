#' Start a shiny game
#' @param game which game do you want to play?
#' @export
play <- function(game = NULL) {
  shiny_dir <- system.file("shiny", package = "gamer")
  games <- list.dirs(shiny_dir, full.names = FALSE)[-1]
  game_msg <- paste("Available Games:\n\n", paste(games, collapse = "\n"), "\n")
  if (is.null(game)) {
    message(game_msg)
  } else if (!is.element(game, games)) {
    message(paste("There is no game called ", game, ".\n\n", game_msg))
  } else {
    shiny::runApp(file.path(shiny_dir, game), display.mode = "normal")
  }
}