context("test-rx_digit")

test_that("digit special character works", {

  # expect match
  expect_true(grepl(rx_digit(), "1"))
  expect_true(grepl(rx_digits(n = 2), "123"))

  # dont expect a match
  expect_false(grepl(rx_digit(), "a"))
  expect_false(grepl(rx_digits(n = 2), "5"))

  # expect inverse
  expect_true(grepl(rx_digit(inverse = TRUE), "a"))
  expect_true(grepl(rx_digits(inverse = TRUE), "not a number!"))

})
