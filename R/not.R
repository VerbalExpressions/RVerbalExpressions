#' Ensure that the parameter does not follow.
#'
#' @description This expression uses a \emph{negative lookahead} to ensure the
#' value given does not follow the previous verbal expression.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param value Value to ensure absence of
#'
#' @examples
#' not(value = "FEB-28")
#'
#' # construct expression
#' x <- start_of_line() %>%
#'   find('FEB-29') %>%
#'   not("FEB-28")
#'
#' # create a string
#' string <- c("FEB-29-2017", "FEB-28-2017")
#'
#' # extract matches, perl = TRUE is required for negative lookahead
#' regmatches(string, regexpr(x, string, perl = TRUE))
#'
#' @references
#' Negative lookahead: \url{https://www.regular-expressions.info/lookaround.html}
#'
#' @export
not <- function(.data = NULL, value) {
  paste0(.data, "(?!", sanitize(value), ")")
}
