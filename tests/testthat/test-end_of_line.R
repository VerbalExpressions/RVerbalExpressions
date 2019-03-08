context("test-rx_end_of_line")

test_that("end_of_line rule works", {

  # expect a $ sign at the very least
  expect_equal(rx_end_of_line(), "$")

  # expect nothin if enable is false
  expect_null(rx_end_of_line(enable = FALSE))

  # expect placement of $ to be at end of .data
  expect_equal(rx_end_of_line("abc"), "abc$")

  # expect match
  expect_true(grepl(rx_end_of_line("abc"), "123abc"))

  # dont expect a match
  expect_false(grepl(rx_end_of_line("abc"), "123ac"))
})
