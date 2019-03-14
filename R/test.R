#' Test rx expression.
#'
#' @description The function \code{rx_test()} is intended for quick testing of \code{rx} expressions without loading new packages.
#' It uses combination of \code{regexmatches} and \code{gregexpr} to extract all matches of pattern in a string. Since
#' \code{rx} pattern argument is first, it support piping and can be placed at the end of the \code{rx} pipe for testing purposes.
#'
#' @param x \code{rx} expression to test
#' @param txt Text string to be used for matching a pattern.
#'
#' @examples
#' rx_digit() %>%
#'   rx_test("Why is 6 afraid of 7? Because 7,8,9")
#' @export
rx_test <- function(x, txt){
  regmatches(txt, gregexpr(x, txt, perl = TRUE))
}
