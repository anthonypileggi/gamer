#' Start a shiny game
#' @param game which game do you want to play?
#' @export
play <- function(game) {
  app_dir <- system.file("shiny", game, package = "gamer")
  if (app_dir == "") {
    message(paste("There is no game called ", game, ". Please try again.\n"))
  } else {
    shiny::runApp(app_dir, display.mode = "normal")
  }
}