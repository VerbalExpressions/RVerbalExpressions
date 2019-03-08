#' Begin a capture group.
#'
#' @details Capture groups are used to extract data from within the regular
#' expression match for further processing.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#'
#' @export
rx_begin_capture <- function(.data = NULL) {
  if(is.null(.data)) {
    paste0("(")
  } else {
    paste0("(", .data)
  }
}

#' End a capture group.
#'
#' @details Capture groups are used to extract data from within the regular
#' expression match for further processing.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#'
#' @export
rx_end_capture <- function(.data = NULL) {
  if(is.null(.data)) {
    paste0(")")
  } else {
    paste0(.data, ")")
  }
}

