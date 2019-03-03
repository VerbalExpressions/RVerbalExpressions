context("test-br")

test_that("br special character works", {

  # expect minimal output
  expect_equal(br(), "(?:\\r\\n|\\r|\\n)")

  # expect match
  expect_true(grepl(br(), "\n"))

  # expect match
  expect_true(grepl(br(), "\r"))

  # expect match
  expect_true(grepl(br(), "hello\nworld"))

  # expect match
  expect_true(grepl(br(), "hello\rworld"))

})
