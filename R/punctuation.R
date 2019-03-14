#' Match punctuation characters.
#'
#' @description Matches punctuation characters only:
#' \code{! \" # $ \% & ' ( ) * + , - . / : ; < = > ? @ [ \\ ] ^ _ ` { | } ~}.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param negate Invert match behavior, defaults to \code{FALSE} (match
#' punctuation). Use \code{FALSE} to \emph{not} match punctuation.
#'
#' @examples
#' rx_punctuation()
#' rx_punctuation(negate = TRUE)
#'
#' # create an expression
#' x <- rx_punctuation()
#'
#' # create input
#' string <- 'Apple 1!'
#'
#' # extract match
#' regmatches(string, gregexpr(x, string))
#'
#' # dont extract punctuation
#' y <- rx_punctuation(negate = TRUE)
#' regmatches(string, gregexpr(y, string))
#' @export
rx_punctuation <- function(.data = NULL, rep=NULL, mode="greedy", negate = FALSE) {
  res <- paste0(.data, parse_negate(negate, "[[:punct:]]"), parse_rep_mode(rep, mode))
  new_rx(res)
}
