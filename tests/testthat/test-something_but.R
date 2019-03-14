context("test-rx_something_but")

test_that("something_but rule works", {

  # expect match
  expect_true(grepl(rx() %>% rx_something_but(value = "a"), "b"))
  expect_true(grepl(rx() %>% rx_something_but(value = "a", mode = "lazy"), "b"))

  # dont expect match
  expect_false(grepl(rx() %>% rx_something_but(value = "a"), "a"))

  # expect to match something but "a"
  expect_equal(
    regmatches("abc", gregexpr(rx() %>% rx_something_but(value = "a"), "abc"))[[1]], "bc"
  )
  expect_true(
    compare(regmatches("abc", gregexpr(rx() %>% rx_something_but(value = "a", mode = "lazy"), "abc"))[[1]], c("b", "c"))$equal
  )

  # expect an error if invalid 'mode' is given
  expect_error(rx() %>% rx_something_but(mode = "whatever"))
})
