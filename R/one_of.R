#' Match any of these characters exactly once.
#'
#' @description Constructs a \emph{character class}, sometimes called a
#' \emph{character set}. With this particular expression, you can tell the
#' regex engine to match only one out of several characters. It does this by
#' simply placing the characters you want to match between square brackets.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{\%>\%}
#' @param ... Literal expressions and \code{rx} statements to optionally match
#'
#' @note This function *can not* stand first in the chain of \code{rx} statements and requires constructor function \code{rx()}
#' when used in piped series of commands.
#'
#' @examples
#' rx() %>%
#'    rx_one_of("abc")
#'
#' # create an expression
#' x <- rx() %>% rx_one_of("abc")
#'
#' grepl(x, "c") # should be true
#' grepl(x, "d") # should be false
#'
#' y <- rx_find("gr") %>%
#'   rx_one_of("ae") %>%
#'   rx_find("y")
#'
#' regmatches("gray", regexec(y, "gray"))[[1]]
#' regmatches("grey", regexec(y, "grey"))[[1]]
#'
#' @references
#' Character class: \url{https://www.regular-expressions.info/charclass.html}
#' @export
rx_one_of <- function(.data = NULL, ..., rep=NULL, mode="greedy") {
  UseMethod("rx_one_of", .data)
}

#' @export
rx_one_of.rx_string <- function(.data = NULL, ..., rep=NULL, mode="greedy") {
  res <- paste0(.data, "[", sanitize_args(...), "]", parse_rep_mode(rep, mode))
  new_rx(res)
}

#' @export
rx_one_of.default <- function(.data = NULL, ..., rep=NULL, mode="greedy") {
  stop("This function is not to be used as first element of the pipe! Please start pipe with constructor funcion rx()")
}
