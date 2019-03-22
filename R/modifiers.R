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
#' x <- rx_find(value = "abc") %>%
#'   rx_with_any_case()
#'
#' # case sensitive
#' y <- rx_find(value = "abc") %>%
#'   rx_with_any_case(enable = FALSE)
#'
#' grepl(x, "ABC") # should be true
#' grepl(y, "ABC") # should be false
#' @export
rx_with_any_case <- function(.data = NULL, enable = TRUE) {
  if(is.null(.data) & enable == TRUE) {
    paste0("(?i)")
  } else if(!is.null(.data) & enable == TRUE) {
    paste0("(?i)", .data)
  } else {
    .data
  }
}

#' Repeat the previous item exactly count times.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param n Number of times to repeat
#' @export
rx_repeat_previous <- function(.data, n) {
  switch (
    as.character(missing(n)),
    "FALSE" = paste0(.data, "{", n, "}"),
    "TRUE" = stop("n requires an integer")
  )
}
