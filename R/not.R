#' Ensure that the parameter does not follow.
#'
#' @description This expression uses a \emph{negative lookahead} to ensure the
#' value given does not follow the previous verbal expression,
#' \code{perl = TRUE} is required. For example, if you were to look for the
#' letter \emph{q} but not the letter \emph{u} you might translate this to,
#' "find the letter q everytime the letter u does \emph{not} come after it".
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param value Value to ensure absence of
#'
#' @examples
#' rx_not(value = "FEB-28")
#'
#' # construct expression
#' x <- rx_start_of_line() %>%
#'   rx_find('FEB-29') %>%
#'   rx_not("FEB-28")
#'
#' # create a string
#' string <- c("FEB-29-2017", "FEB-28-2017")
#'
#' # extract matches, perl = TRUE is required for negative lookahead
#' regmatches(string, regexpr(x, string, perl = TRUE))
#'
#' # another example
#' rx_find(value = "q") %>%
#'   rx_not("u") %>%
#'   grepl(x = c("qu", "qa", "qq", "q", "q u"), perl = TRUE)
#'
#' @references
#' Negative lookahead: \url{https://www.regular-expressions.info/lookaround.html}
#'
#' @export
rx_not <- function(.data = NULL, value) {
  paste0(.data, "(?!", sanitize(value), ")")
}
