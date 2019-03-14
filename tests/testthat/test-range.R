context("test-rx_range")

test_that("range rule works", {

  # expect minimal output
  expect_equal(rx_range(value=""), new_rx("[]"))

  # expect equal length even if unequal length given
  expect_length(
    regmatches(
      rx_range(value=c(1, 2, 3)),
      gregexpr(rx_digit(), rx_range(value=c(1, 2, 3))))[[1]], 2
    )

  # expect that unequal range entry (3) is ignored
  expect_equal(
    regmatches(
      rx_range(value=c(1, 2, 3)),
      gregexpr(rx_digit(), rx_range(value=c(1, 2, 3))))[[1]], c("1", "2")
  )


})
