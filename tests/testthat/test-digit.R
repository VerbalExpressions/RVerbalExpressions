context("test-rx_digit")

test_that("digit special character works", {

  # expect match
  expect_true(grepl(rx_digit(), "1"))
  expect_true(grepl(rx_digit() %>% rx_multiple(max = 3), "123"))

  # dont expect a match
  expect_false(grepl(rx_digit(), "a"))
  expect_false(grepl(rx_digit() %>% rx_multiple(min = 2), "5"))

  # expect inverse
  expect_true(grepl(rx_digit(inverse = TRUE), "a"))
  expect_true(grepl(rx_digit(inverse = TRUE), "not a number!"))

  # expect error
  expect_error(rx_digit(inverse = "nope"))
  expect_error(rx_digit(inverse = "still no"))

})
