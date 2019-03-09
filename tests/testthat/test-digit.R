context("test-rx_digit")

test_that("digit special character works", {

  # expect match
  expect_true(grepl(rx_digit(), "1"))
  expect_true(grepl(rx_digits(2), "123"))

  # dont expect a match
  expect_false(grepl(rx_digit(), "a"))
  expect_false(grepl(rx_digits(2), "5"))

})
