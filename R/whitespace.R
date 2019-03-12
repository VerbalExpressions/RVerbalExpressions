#' Match a whitespace character.
#'
#' @details Match a whitespace character (one of space, tab, carriage return,
#' new line, vertical tab and form feed). This function is looks for tabs with
#' the following expression: \code{\\d}
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
#' @param inverse Invert match behavior, defaults to \code{FALSE} (match
#' whitespace). Use \code{TRUE} to \emph{not} match whitespace.
#'
#' @examples
#' # match whitespace, default
#' rx_whitespace()
#'
#' # dont match whitespace
#' rx_whitespace(inverse = TRUE)
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
#' y <- rx_whitespace(inverse = TRUE)
#' regmatches(string, gregexpr(y, string))
#' @export
rx_whitespace <- function(.data = NULL, inverse = FALSE) {
  switch(as.character(inverse),
    "FALSE" = paste0(.data, "\\s"),
    "TRUE" = paste0(.data, "[^ \t\r\n]"),
    stop("Inverse accepts either TRUE (don't match whitespace) or FALSE (default, match whitespace)")
  )
}
