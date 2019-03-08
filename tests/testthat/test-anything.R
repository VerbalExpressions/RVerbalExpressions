context("test-anything")

test_that("anything rule works", {
  # expect bare output
  expect_equal(anything(), "(?:.*)")
  expect_equal(anything(mode = "lazy"), "(?:.*?)")

  # expect match
  expect_true(grepl(anything(), "b"))
  expect_true(grepl(anything(mode = "lazy"), "b"))

  # expect match
  expect_true(grepl(anything(), "a!.>\\"))
  expect_true(grepl(anything(mode = "lazy"), "a!.>\\"))

  # expect pipe functionality
  expect_equal(anything(.data = "^"), "^(?:.*)")
  expect_equal(anything(.data = "^", mode = "lazy"), "^(?:.*?)")

  # expect an error if invalid 'mode' is given
  expect_error(anything(mode = "whatever"))

  # expect correct number of matches
  expect_true(nchar(unlist(regmatches("abc", gregexpr(anything(), "abc")))) == 3)
  expect_true(compare(nchar(unlist(regmatches("abc", gregexpr(anything(mode="lazy"), "abc")))), c(0,0,0))$equal)
})
