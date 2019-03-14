#' Match a word.
#'
#' @description Match a word—a string of word characters (a–z, A–Z, 0–9 or _).
#' This function is looks for tabs with the following expression: \code{\\w+}
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#'
#' @examples
#' rx_word()
#'
#' # create an expression
#' x <- rx_word()
#'
#' # create inputs
#' string1 <- "foo_bar"
#' string2 <- "foo-bar"
#'
#' # extract matches
#' regmatches(string1, regexpr(x, string1))
#' regmatches(string2, regexpr(x, string2)) # doesn't match -
#' @export
rx_word <- function(.data = NULL, mode="greedy", negate = FALSE) {
  res <- paste0(.data, parse_negate(negate, "\\w", "\\W"), parse_rep_mode("some", mode))
  new_rx(res)
}

#' Find beginning or end of a word.
#'
#' @description Match beginning or end of a word—a string consisting of of word characters (a–z, A–Z, 0–9 or _).
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#'
#' @examples
#' rx_word_edge()
#'
#'x <- rx_word_edge() %>%
#'  rx_alpha() %>%
#'  rx_one_or_more() %>%
#'  rx_word_edge()
#'
#'# create inputs
#'string1 <- "foobar"
#'string2 <- "foo 23a bar"
#'
#'# matches 'foobar'
#'regmatches(string1, regexpr(x, string1))
#'# matches 'foo' and 'bar' separately
#'regmatches(string2, gregexpr(x, string2))
#' @export
rx_word_edge <- function(.data = NULL, negate = FALSE) {
  res <- paste0(.data, parse_negate(negate, "\\b", "\\B"))
  new_rx(res)
}


#' Match a word character.
#'
#' @description Match a word character (a–z, A–Z, 0–9 or _).
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#'
#' @examples
#' rx_word_char()
#'
#' # Same as rx_word()
#'x <- rx_word_char() %>%
#'  rx_one_or_more()
#'
#' @export
rx_word_char<- function(.data = NULL, rep=NULL, mode="greedy", negate = FALSE) {
  res <- paste0(.data, parse_negate(negate, "\\w", "\\W"), parse_rep_mode(rep, mode))
  new_rx(res)
}

