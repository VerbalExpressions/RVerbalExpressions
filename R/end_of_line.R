#' Match the expression only if it appears till the end of the line.
#'
#' @description Control whether to match the expression only if it appears till
#' the end of the line. Basically, append a \code{$} to the end of the
#' expression. The dollar sign is considered an \emph{anchor} and matches the
#' position of characters. It can be used to "anchor" the regex match at a
#' certain position, in this case the dollar sign matches right after the last
#' character in the string.
#'
#' @param .data Expression to match, typically pulled from the pipe \code{ \%>\% }
#' @param enable Whether to enable this behavior, defaults to \code{TRUE}
#'
#' @examples
#' end_of_line(enable = TRUE)
#' end_of_line(enable = FALSE)
#' end_of_line("abc", enable = TRUE)
#'
#' # create expression
#' x <- start_of_line(FALSE) %>%
#'   then("apple") %>%
#'   end_of_line()
#'
#' grepl(x, "apples") # should be false
#' grepl(x, "apple")  # should be true
#'
#' @references
#' Anchors: \url{https://www.regular-expressions.info/anchors.html}
#' @export
end_of_line <- function(.data = NULL, enable = TRUE) {
  if (enable) {
    paste0(.data, "$")
  } else {
    .data
  }
}
