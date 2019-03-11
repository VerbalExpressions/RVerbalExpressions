#' Match a literal sequence of characters.
#'
#' @description The function \code{rx_literal()} allows specification of characters to be matched literally.
#' Symbols provided in `value` will be escaped.
#'
#' @rdname rx_literal
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#' @param value Literal string to be matched. Can include any symbols.
#'
#' @examples
#' # Will be matched literally to "?"
#' rx_literal("?")
#'
#' # create an expression
#' x <- rx_literal("gr") %>%
#'   rx_one_of("ae") %>%
#'   rx_literal("y")
#'
#' # create input
#' string <- "Look at the grey skies!"
#'
#' # extract match
#' regmatches(string, regexpr(x, string))
#' @export
rx_literal <- function(.data, value) {
  UseMethod("rx_literal", .data)
}

#' @export
rx_literal.rx_string <- function(.data, value) {
  res <- paste0(.data, sanitize(value))
  new_rx(res)
}

#' @export
rx_literal.default <- function(.data, value){
  res <- paste0(sanitize(.data), sanitize(value))
  new_rx(res)
}
