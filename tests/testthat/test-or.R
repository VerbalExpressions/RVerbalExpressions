context("test-or")

test_that("rx_or works", {

  # expect template output
  expect_equal(rx_or("foo", "bar"), "(?:foo)|(?:bar)")

})
