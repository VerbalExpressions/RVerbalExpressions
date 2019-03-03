context("test-tab")

test_that("tab special character works", {
  # expect minimal output
  expect_equal(tab(), "\\t")

  # expect match
  expect_true(grepl(tab(), "\t"))

  # expect match
  expect_true(grepl(tab(), "hello\tworld"))

})
