#' Deck R6 Class
#' @importFrom magrittr "%>%"
#' @export
Deck <- R6::R6Class("Deck",
  public = list(
    decks = NULL,
    deck = NULL,
    initialize = function(decks = 1) {
      self$decks <- decks
      self$deck <-
        tidyr::crossing(
          value = c(2:10, "J", "Q", "K", "A"),
          #suit = c("heart", "diamond", "spade", "club")
          suit = c("♥", "♦", "♠",  "♣")
        )
      #self$deck <- self$deck$shuffle()   # is there any way to use methods during initialization?
      self$deck <- dplyr::sample_n(self$deck, nrow(self$deck))
    },
    print = function(...) {
      cat("Deck: \n")
      cat("  Decks: ", self$decks, "\n", sep = "")
      cat("  Cards:  ", 52 * self$decks, "\n", sep = "")
      cat("  Cards dealt:  ", 52 * self$decks - nrow(self$deck), "\n", sep = "")
      cat("  Cards left:  ", nrow(self$deck), "\n", sep = "")
      cat("  Next card:  ", self$deck$value[1], " of ", self$deck$suit[1], "s\n", sep = "")
      invisible(self)
    },
    shuffle = function() {
      self$deck <- dplyr::sample_n(self$deck, nrow(self$deck))
    },
    draw = function(n = 1) {
      cards <- self$deck[1:n, ]
      self$deck <- self$deck[-(1:n), ]
      cards
    }
  ),
  private = list(

  )
)