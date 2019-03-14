#' Match a tab character.
#'
#' @details This function is looks for tabs with the following
#' expression: \code{\\t}
#' \enumerate{
#'   \item Tab character: \url{https://codepoints.net/U+0009}
#' }
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param negate Invert match behavior, defaults to \code{FALSE} (match
#' tabs). Use \code{FALSE} to \emph{not} match tabs.
#'
#' @examples
#' rx_tab()
#' rx_tab(negate = TRUE)
#'
#' # create an expression
#' x <- rx_tab()
#'
#' # create input
#' string <- "foo\tbar"
#'
#' # extract match
#' regmatches(string, regexpr(x, string))
#' @export
rx_tab <- function(.data = NULL, rep=NULL, mode="greedy", negate = FALSE) {
  res <- paste0(.data, parse_negate(negate, "\\t"), parse_rep_mode(rep, mode))
  new_rx(res)
}
