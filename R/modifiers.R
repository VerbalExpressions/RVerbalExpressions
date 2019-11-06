#' Control case-insensitive matching.
#'
#' @details Equivalent to adding or removing the i modifier.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param enable Whether to enable this behavior
#'
#' @examples
#' rx_with_any_case()
#'
#' # case insensitive
#' x <- rx() %>%
#'   rx_find("abc") %>%
#'   rx_with_any_case()
#'
#' # case sensitive
#' y <- rx() %>%
#'   rx_find("abc") %>%
#'   rx_with_any_case(enable = FALSE)
#'
#' grepl(x, "ABC") # should be true
#' grepl(y, "ABC") # should be false
#' @export
rx_with_any_case <- function(.data = NULL, enable = TRUE) {
  if(is.null(.data) & enable == TRUE) {
    new_rx(paste0("(?i)"))
  } else if(!is.null(.data) & enable == TRUE) {
    new_rx(paste0("(?i)", .data))
  } else {
    .data
  }
}
