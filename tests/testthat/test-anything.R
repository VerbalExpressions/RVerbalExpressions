context("test-anything")

test_that("anything rule works", {
  # expect bare output
  expect_equal(anything(), "(?:.*)")

  # expect match
  expect_true(grepl(anything(), "b"))

  # expect match
  expect_true(grepl(anything(), "a!.>\\"))

  # expect pipe functionality
  expect_equal(anything(.data = "^"), "^(?:.*)")

  # expect correct number of matches
  expect_true(nchar(unlist(regmatches("abc", gregexpr(anything(), "abc")))) == 3)
})
