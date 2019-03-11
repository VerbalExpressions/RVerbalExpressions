context("test-rx_with_any_case")

test_that("with_any_case modifier works", {

  # expect minimum output
  expect_equal(rx_with_any_case(), "(?i)")

  # expect correct paste0 procedure in if else
  expect_equal(rx_with_any_case("abc"), "(?i)abc")

  # expect match
  expect_true(grepl(rx_find(value = "ABC") %>% rx_with_any_case(), "abc"))

  # dont expect match
  expect_false(grepl(rx_find(value = "ABC") %>% rx_with_any_case(enable = FALSE), "abc"))

})
