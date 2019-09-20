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
rx_avoid_prefix <- function(.data = NULL, value) {
  new_rx(paste0(.data, "(?<!", sanitize(value), ")"))
}

#' @rdname rx_avoid
#' @export
rx_avoid_suffix <- function(.data = NULL, value) {
  new_rx(paste0(.data, "(?!", sanitize(value), ")"))
}

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
rx_seek_prefix <- function(.data = NULL, value) {
  new_rx(paste0(.data, "(?<=", sanitize(value), ")"))
}

#' @rdname rx_seek
#' @export
rx_seek_suffix <- function(.data = NULL, value) {
  new_rx(paste0(.data, "(?=", sanitize(value), ")"))
}
