context("test-rx_something")

test_that("something rule works", {

  # expect match
  expect_true(grepl(rx_something(), "something"))
  expect_true(grepl(rx_something(mode="lazy"), "something"))

  # expect match
  expect_true(grepl(rx_something(), " "))
  expect_true(grepl(rx_something(mode="lazy"), " "))

  # dont expect match
  expect_false(grepl(rx_something(), ""))
  expect_false(grepl(rx_something(mode = "lazy"), ""))

  # expect an error if invalid 'mode' is given
  expect_error(rx_something(mode = "whatever"))
})
