# Deprecated because is collides with base R's any and any_of is fine.

# #' Match any of these characters exactly once (alias of \code{any_of()}).
# #'
# #' @description Constructs a \emph{character class}, sometimes called a
# #' \emph{character set}. With this particular expression, you can tell the
# #' regex engine to match only one out of several characters. Simply place the
# #' characters you want to match between square brackets.
# #'
# #' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
# #' @param value Expression to optionally match
# #'
# #' @examples
# #' any(value = "abc")
# #'
# #' # create an expression
# #' x <- any(value = "abc")
# #'
# #' grepl(x, "c") # should be true
# #' grepl(x, "d") # should be false
# #'
# #' @references
# #' Character class: \url{https://www.regular-expressions.info/charclass.html}
# #' @export
# any <- function(.data = NULL, value) {
#   paste0(.data, "[", sanitize(value), "]")
# }
