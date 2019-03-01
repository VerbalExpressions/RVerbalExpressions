#' Begin a capture group.
#'
#' @details Capture groups are used to extract data from within the regular
#' expression match for further processing.
#'
#' @param .data Expression to append, typically pulled from the pipe \code{ \%>\% }
#'
#' @export
begin_capture <- function(.data = NULL) {
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
end_capture <- function(.data = NULL) {
  if(is.null(.data)) {
    paste0(")")
  } else {
    paste0(.data, ")")
  }
}

