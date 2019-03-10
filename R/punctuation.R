#' Match punctuation characters.
#'
#' @description Matches punctuation characters only:
#' \code{! \" # $ \% & ' ( ) * + , - . / : ; < = > ? @ [ \\ ] ^ _ ` { | } ~}.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#'
#' @examples
#' rx_punctuation()
#'
#' # create an expression
#' x <- rx_punctuation()
#'
#' # create input
#' string <- 'Apple 1!'
#'
#' # extract match
#' regmatches(string, gregexpr(x, string))
#' @export
rx_punctuation <- function(.data = NULL) {
  paste0(.data, "[[:punct:]]")
}
