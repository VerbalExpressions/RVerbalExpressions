context("test-rx_anything")

test_that("anything rule works", {
  # expect bare output
  expect_equal(rx_anything(), "(?:.*)")

  # expect match
  expect_true(grepl(rx_anything(), "b"))

  # expect match
  expect_true(grepl(rx_anything(), "a!.>\\"))

  # expect pipe functionality
  expect_equal(rx_anything(.data = "^"), "^(?:.*)")

  # expect correct number of matches
  expect_true(nchar(unlist(regmatches("abc", gregexpr(rx_anything(), "abc")))) == 3)
})
