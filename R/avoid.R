#' Negative lookaround functions
#'
#' @description This function facilitates matching by providing negative assurances for surrounding symbols/groups of symbols.
#' It allows for building expressions that are dependent on context of occurence.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param value Exact expression to match
#'
#' @examples
#' # matches any number of digits, but not preceded by "USD"
#' rx() %>% rx_avoid_prefix('USD') %>% rx_digit() %>% rx_one_or_more()
#'
#' #matches a digit, but not followed by " dollars"
#' rx() %>% rx_digit() %>% rx_avoid_suffix(' dollars')
#'
#' @rdname rx_avoid
#' @export
rx_avoid_prefix <- function(.data = NULL, ...) {
  if (!inherits(.data, "rx_string")) stop("This function is not to be used as first element of the pipe! Please start pipe with constructor funcion rx()")
  san_args <- sapply(list(...), sanitize)
  res <- paste0(.data, "(?<!", paste0(san_args, collapse = ""), ")")
  new_rx(res)
}

#' @rdname rx_avoid
#' @export
rx_avoid_suffix <- function(.data = NULL, ...) {
  if (!inherits(.data, "rx_string")) stop("This function is not to be used as first element of the pipe! Please start pipe with constructor funcion rx()")
  san_args <- sapply(list(...), sanitize)
  res <- paste0(.data, "(?!", paste0(san_args, collapse = ""), ")")
  new_rx(res)
}
