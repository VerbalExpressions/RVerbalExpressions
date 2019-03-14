#' Match a line break (alias of \code{rx_line_break()}).
#'
#' @description This expression looks for line breaks, both Unix and Windows
#' style by using the appropriate \emph{non printable characters}.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#'
#' @examples
#' rx_br()
#'
#' # create an expression
#' x <- rx_br()
#'
#' # create input
#' string <- "foo\nbar"
#'
#' # extract match
#' regmatches(string, regexpr(x, string))
#'
#' @references
#' Unix style: \url{https://codepoints.net/U+000A}
#'
#' Windows style: \url{https://codepoints.net/U+000D}
#'
#' Non printable character: \url{https://www.regular-expressions.info/nonprint.html}
#' @export
rx_br <- function(.data = NULL, rep=NULL, mode="greedy", negate = FALSE) {
  res <- paste0(.data, parse_negate(negate, "(?:\\r\\n|\\r|\\n)", "\\r\\n"), parse_rep_mode(rep, mode))
  new_rx(res)
}
