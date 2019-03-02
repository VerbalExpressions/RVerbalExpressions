context("test-anything_but")

test_that("anything_but rule works", {
  # exoect the correct output
  expect_equal(anything_but(value = "abc"), "(?:[^abc]*)")

  # expect an error if nothing is given
  expect_error(anything_but())

  # expect .data works
  expect_equal(anything_but("^", value = "abc"), "^(?:[^abc]*)")
})
