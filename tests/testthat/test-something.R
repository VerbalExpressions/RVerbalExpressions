context("test-rx_something")

test_that("something rule works", {

  # expect match
  expect_true(grepl(rx_something(), "something"))

  # expect match
  expect_true(grepl(rx_something(), " "))

  # dont expect match
  expect_false(grepl(rx_something(), ""))

})
