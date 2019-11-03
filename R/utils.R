#' Pipe operator
#'
#' See \code{magrittr::\link[magrittr]{\%>\%}} for details.
#'
#' @name %>%
#' @rdname pipe
#' @keywords internal
#' @export
#' @importFrom magrittr %>%
#' @usage lhs \%>\% rhs
NULL

#' Escape characters expected special by regex engines
#'
#' @description Takes a string and escapes all characters considered special by
#' the regex engine. This is used internally when you add a string to the
#' \code{value} parameter in most of the available functions. It is exported
#' and usable externally for users that want to escape all special characters
#' in their desired match. The following special characters are escaped
#' \code{. | * ? + ( ) { } ^ $ \\ : = [ ]}
#'
#' @param x String to sanitize
#'
#' @examples
#' sanitize("^")
#' sanitize("^+")
#' sanitize("^+?")
#' #export - nade not exported
#'
#' @export
sanitize <- function(x) {
  UseMethod("sanitize", x)
}

#' @export
sanitize.rx_string <- function(x) {
  x
}

#' @export
sanitize.character <- function(x) {
  if(missing(x))
    stop("The 'value' argument is missing. Did you forget to start the rx chain with rx()?")
  esc <- c(".", "|", "*", "?", "+", "(", ")", "{", "}", "^", "$", "\\", ":", "=", "[", "]")
  gsub(paste0("([\\", paste0(collapse = "\\", esc), "])"), "\\\\\\1", x, perl = TRUE)
}

is.rx_string <- function(x) {
  inherits(x, "rx_string")
}

new_rx <- function(x) {
  if(is.rx_string(x)) return(x)
  class(x) <- c("rx_string", class(x))
  x
}

#' @export
print.rx_string <- function(x, ...) {
  if (is.rx_string(x)) attributes(x) <- NULL
  print.default(x)
}
