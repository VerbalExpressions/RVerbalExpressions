context("test-rx_uppercase")

test_that("uppercase works", {

  # expect match
  expect_true(grepl(rx_uppercase(), "A"))

  # dont expect match
  expect_false(grepl(rx_uppercase(), "a"))
  expect_false(grepl(rx_uppercase(), "!"))

  # expect pipe functionality
  expect_equal(rx() %>% rx_start_of_line() %>% rx_uppercase(), "^[[:upper:]]")

  # expect inverse
  expect_true(grepl(rx_uppercase(inverse = TRUE), "abc"))
  expect_true(grepl(rx_uppercase(inverse = TRUE), "!"))
  expect_false(grepl(rx_uppercase(inverse = TRUE), "ABC"))

  # expect error if not TRUE/FALSE for inverse arg
  expect_error(rx_uppercase(inverse = "x"))

})
