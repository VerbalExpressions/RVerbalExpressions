context("test-rx_digit")

test_that("digit special character works", {

  # expect match
  expect_true(grepl(rx_digit(), "1"))


  # dont expect a match
  expect_false(grepl(rx_digit(), "a"))


  # expect inverse
  expect_true(grepl(rx_digit(inverse = TRUE), "a"))


  # expect error
  expect_error(rx_digit(inverse = "nope"))



  # dont expect a match
  expect_false(grepl(rx_digit(), "a"))


})
