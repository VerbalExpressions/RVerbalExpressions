#' Match a tab character.
#'
#' @details This function is looks for tabs with the following
#' expression: \code{\\t}
#' \enumerate{
#'   \item Tab character: \url{https://codepoints.net/U+0009}
#' }
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param inverse Invert match behavior, defaults to \code{FALSE} (match
#' tabs). Use \code{FALSE} to \emph{not} match tabs.
#'
#' @examples
#' rx_tab()
#' rx_tab(inverse = TRUE)
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
rx_tab <- function(.data = NULL, inverse = FALSE) {
  switch(as.character(inverse),
         "FALSE" = paste0(.data, "\\t"),
         "TRUE" = paste0(.data, "[^\\t]"),
         stop("Inverse accepts either TRUE (don't match tabs) or FALSE (default, match tabs)")
  )
}
