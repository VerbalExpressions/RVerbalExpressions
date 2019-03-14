context("test-rx_br")

test_that("br special character works", {

  # expect minimal output
  expect_equal(rx_br(), "(?:\\r\\n|\\r|\\n)")
  expect_equal(rx_line_break(), "(?:\\r\\n|\\r|\\n)")

  # expect match
  expect_true(grepl(rx_br(), "\n"))
  expect_true(grepl(rx_line_break(), "\n"))

  # expect match
  expect_true(grepl(rx_br(), "\r"))
  expect_true(grepl(rx_line_break(), "\r"))

  # expect match
  expect_true(grepl(rx_br(), "hello\nworld"))
  expect_true(grepl(rx_line_break(), "hello\nworld"))

  # expect match
  expect_true(grepl(rx_br(), "hello\rworld"))
  expect_true(grepl(rx_line_break(), "hello\rworld"))
  expect_equal(rx_br(), new_rx("(?:\\r\\n|\\r|\\n)"))

  # expect match
  expect_true(grepl(rx_br(), new_rx("\n")))

  # expect match
  expect_true(grepl(rx_br(), new_rx("\r")))

  # expect match
  expect_true(grepl(rx_br(), new_rx("hello\nworld")))

  # expect match
  expect_true(grepl(rx_br(), new_rx("hello\rworld")))

})
