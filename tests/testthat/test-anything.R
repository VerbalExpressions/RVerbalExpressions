context("test-anything")

test_that("anything rule works", {
  expect_equal(anything(), "(?:.*)")
  expect_true(grepl(anything(), "b"))
  expect_true(grepl(anything(), "a!.>\\"))
  expect_equal(anything(.data = "^"), "^(?:.*)")
  expect_true(nchar(unlist(regmatches("abc", gregexpr(anything(), "abc")))) == 3)
})
