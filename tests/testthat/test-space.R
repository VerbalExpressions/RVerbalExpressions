context("test-rx_space")

test_that("space special character works", {

  # expect minimum output
  expect_equal(rx_space(), new_rx(" "))

  # expect match
  expect_true(grepl(rx_space(), " "))
  expect_true(grepl(rx_space(), "cat dog"))
  expect_true(grepl(rx_space(negate = TRUE), "\t"))
  expect_true(grepl(rx_space(negate = TRUE), "\n"))
  expect_true(grepl(rx_space(negate = TRUE), "\r"))

  # dont expect match
  expect_false(grepl(rx_space(), ""))
  expect_false(grepl(rx_space(), "\t"))
  expect_false(grepl(rx_space(), "\n"))
  expect_false(grepl(rx_space(), "\r"))

  # expect inverse
  expect_false(grepl(rx_space(negate = TRUE), " "))
  expect_equal(
    regmatches("cat dog", gregexpr(rx_space(negate = TRUE), "cat dog"))[[1]],
    c("c", "a", "t", "d", "o", "g")
  )

  # expect error message when inverse arg is incorrect
  expect_error(rx_space(inverse = "nope"))

})
