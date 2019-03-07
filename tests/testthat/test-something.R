context("test-something")

test_that("something rule works", {

  # expect match
  expect_true(grepl(something(), "something"))

  # expect match
  expect_true(grepl(something(), " "))

  # dont expect match
  expect_false(grepl(something(), ""))

})
