context("test-anything_but")

test_that("anything_but rule works", {
  # exoect the correct output
  expect_equal(anything_but(value = "abc"), "(?:[^abc]*)")
  expect_equal(anything_but(value = "abc", mode="lazy"), "(?:[^abc]*?)")

  # expect an error if nothing is given
  expect_error(anything_but())

  # expect an error if invalid 'mode' is given
  expect_error(anything_but(value = "abc", mode = "whatever"))

  # expect .data works
  expect_equal(anything_but("^", value = "abc"), "^(?:[^abc]*)")
  expect_equal(anything_but("^", value = "abc", mode = "lazy"), "^(?:[^abc]*?)")
})
