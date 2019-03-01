#' Match the expression only if it appears till the end of the line.
#'
#' @description Control whether to match the expression only if it appears till
#' the end of the line.
#'
#' @details This function is slighly different than \code{start_of_line()}
#' because it has the additional argument \code{.data} which allows the user to
#' pass a value to to it. This is meant to allow \code{dplyr} chains to
#' function properly as \code{.data} defaults to \code{NULL} and will pull
#' the data from the previous step in the chain.
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
#' @export
end_of_line <- function(.data = NULL, enable = TRUE) {
  if (enable) {
    paste0(.data, "$")
  } else {
    .data
  }
}
