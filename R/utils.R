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
#' and useable externally for users that want to escape all special characters
#' in their desired match. The following special characters are escaped
#' \code{. | * ? + ( ) { } ^ $ \\ : = [ ]}
#'
#' @param .data String to sanitize
#'
#' @examples
#' sanitize("^")
#' sanitize("^+")
#' sanitize("^+?")
#' @export
sanitize <- function(.data = NULL) {
  if(missing(.data))
    stop("The 'value' argument is missing. Did you forget to start the rx chain with rx()?")
  esc <- c(".", "|", "*", "?", "+", "(", ")", "{", "}", "^", "$", "\\", ":", "=", "[", "]")
  gsub(paste0("([\\", paste0(collapse = "\\", esc), "])"), "\\\\\\1", .data, perl = TRUE)
}
