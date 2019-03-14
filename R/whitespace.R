#' Match a whitespace character.
#'
#' @details Match a whitespace character (one of space, tab, carriage return,
#' new line, vertical tab and form feed).
#' \enumerate{
#'   \item space: \url{https://codepoints.net/U+0020}
#'   \item tab: \url{https://codepoints.net/U+0009}
#'   \item carriage return: \url{https://codepoints.net/U+000D}
#'   \item new line: \url{https://codepoints.net/U+000}
#'   \item vertical tab: \url{https://codepoints.net/U+000B}
#'   \item form feed: \url{https://codepoints.net/U+000C}
#' }
#'
#' @param .data Expression to append, typically pulled from the pipe \code{\%>\%}
#' @param negate Invert match behavior, defaults to \code{FALSE} (match
#' whitespace). Use \code{FALSE} to \emph{not} match whitespace.
#'
#' @examples
#' # match whitespace, default
#' rx_whitespace()
#'
#' # dont match whitespace
#' rx_whitespace(negate = TRUE)
#'
#' # create an expression
#' x <- rx_whitespace()
#'
#' # create input
#' string <- "1 apple"
#'
#' # extract match
#' regmatches(string, regexpr(x, string))
#'
#' # extract no whitespace by inverting behavior
#' y <- rx_whitespace(negate = TRUE)
#' regmatches(string, gregexpr(y, string))
#' @export
rx_whitespace <- function(.data = NULL, rep=NULL, mode="greedy", negate = FALSE) {
  res <- paste0(.data, parse_negate(negate, "\\s", "\\S"), parse_rep_mode(rep, mode))
  new_rx(res)
}
