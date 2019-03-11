context("test-rx_alpha")

test_that("alpha works", {

  # expect match
  expect_true(grepl(rx_alpha(), "Abc"))

  # dont expect match
  expect_false(grepl(rx_alpha(), "!"))

  # dont expect match
  expect_false(grepl(rx_alpha(), "1"))

  # expect pipe functionality to work
  expect_equal(rx() %>% rx_start_of_line() %>% rx_alpha(), "^[[:alpha:]]")

  # expect inverse
  expect_true(grepl(rx_alpha(inverse = TRUE), "!"))

  # expect error message
  expect_error(grepl(rx_alpha(inverse = 1), "!"))

})
