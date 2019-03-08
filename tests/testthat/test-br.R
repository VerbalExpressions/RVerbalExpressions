context("test-rx_br")

test_that("br special character works", {

  # expect minimal output
  expect_equal(rx_br(), "(?:\\r\\n|\\r|\\n)")

  # expect match
  expect_true(grepl(rx_br(), "\n"))

  # expect match
  expect_true(grepl(rx_br(), "\r"))

  # expect match
  expect_true(grepl(rx_br(), "hello\nworld"))

  # expect match
  expect_true(grepl(rx_br(), "hello\rworld"))

})
