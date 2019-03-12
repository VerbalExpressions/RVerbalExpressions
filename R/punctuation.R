#' Match punctuation characters.
#'
#' @description Matches punctuation characters only:
#' \code{! \" # $ \% & ' ( ) * + , - . / : ; < = > ? @ [ \\ ] ^ _ ` { | } ~}.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param inverse Invert match behavior, defaults to \code{FALSE} (match
#' punctuation). Use \code{TRUE} to \emph{not} match punctuation.
#'
#' @examples
#' rx_punctuation()
#' rx_punctuation(inverse = TRUE)
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
#' y <- rx_punctuation(inverse = TRUE)
#' regmatches(string, gregexpr(y, string))
#' @export
rx_punctuation <- function(.data = NULL, inverse = FALSE) {
  switch(as.character(inverse),
         "FALSE" = paste0(.data, "[[:punct:]]"),
         "TRUE" = paste0(.data, "[^[:punct:]]"),
         stop("Inverse accepts either TRUE (don't match punctuation) or FALSE (default, match punctuation)")
  )
}
