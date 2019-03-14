#' Match the expression only if it appears from beginning of line.
#'
#' @description Control whether to match the expression only if it appears from
#' the beginning of the line.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param enable Whether to enable this behavior, defaults to \code{TRUE}
#'
#' @examples
#' rx_start_of_line(enable = TRUE)
#' rx_start_of_line(enable = FALSE)
#'
#' # create expression
#' x <- rx_start_of_line() %>%
#'   rx_find("apple")
#'
#' grepl(x, "pineapple") # should be false
#' grepl(x, "apple")     # should be true
#' @export
rx_start_of_line <- function(.data = NULL, enable = TRUE) {
  res <- paste0(.data, "^")
  new_rx(res)
}
