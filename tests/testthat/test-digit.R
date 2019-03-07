context("test-digit")

test_that("digit special character works", {

  # expect match
  expect_true(grepl(digit(), "1"))

  # dont expect a match
  expect_false(grepl(digit(), "a"))

})
