context("test-rx_br")

test_that("br special character works", {

  # expect minimal output
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
