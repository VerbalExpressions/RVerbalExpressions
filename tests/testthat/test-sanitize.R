context("test-sanitize")

test_that("sanitize utility works", {

  # expect escape
  expect_equal(sanitize("["), "\\[")

  # expect escape
  expect_equal(sanitize("\\[|+$"), "\\\\\\[\\|\\+\\$")

})
