context("test-rx_anything_but")

test_that("anything_but rule works", {
  # exoect the correct output
  expect_equal(rx_anything_but(value = "abc"), "(?:[^abc]*)")

  # expect an error if nothing is given
  expect_error(rx_anything_but())

  # expect .data works
  expect_equal(rx_anything_but("^", value = "abc"), "^(?:[^abc]*)")
})
