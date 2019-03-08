context("test-something")

test_that("something rule works", {

  # expect match
  expect_true(grepl(something(), "something"))
  expect_true(grepl(something(mode="lazy"), "something"))

  # expect match
  expect_true(grepl(something(), " "))
  expect_true(grepl(something(mode="lazy"), " "))

  # dont expect match
  expect_false(grepl(something(), ""))
  expect_false(grepl(something(mode = "lazy"), ""))

  # expect an error if invalid 'mode' is given
  expect_error(something(mode = "whatever"))
})
