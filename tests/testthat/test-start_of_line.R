context("test-start_of_line")

test_that("multiplication works", {

  # expect correct output
  expect_equal(start_of_line(), "^")

  # expect null if start_of_line isn't enabled
  expect_null(start_of_line(enable = FALSE))

})
