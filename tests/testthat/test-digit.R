context("test-rx_digit")

test_that("digit special character works", {

  # expect match
  expect_true(grepl(rx_digit(), "1"))

  # dont expect a match
  expect_false(grepl(rx_digit(), "a"))

})
