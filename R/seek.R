#' Positive lookaround functions
#'
#' @description This function facilitates matching by providing assurances for surrounding symbols/groups of symbols.
#' It allows for building expressions that are dependent on context of occurence.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param value Exact expression to match
#'
#' @examples
#' # this will match anything between square brackets
#' rx() %>%
#'   rx_seek_prefix("[") %>%
#'   rx_anything("lazy") %>%
#'   rx_seek_suffix(']')
#'
#' @rdname rx_seek
#' @export
rx_seek_prefix <- function(.data = NULL, ...) {
  if (!inherits(.data, "rx_string")) stop("This function is not to be used as first element of the pipe! Please start pipe with constructor funcion rx()")
  san_args <- sapply(list(...), sanitize)
  res <- paste0(.data, "(?<=", paste0(san_args, collapse = ""), ")")
  new_rx(res)
}

#' @rdname rx_seek
#' @export
rx_seek_suffix <- function(.data = NULL, ...) {
  if (!inherits(.data, "rx_string")) stop("This function is not to be used as first element of the pipe! Please start pipe with constructor funcion rx()")
  san_args <- sapply(list(...), sanitize)
  res <- paste0(.data, "(?=", paste0(san_args, collapse = ""), ")")
  new_rx(res)
}
