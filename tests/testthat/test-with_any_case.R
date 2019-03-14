context("test-rx_with_any_case")

test_that("with_any_case modifier works", {

  # expect minimum output
  expect_equal(rx_with_any_case(), new_rx("(?i)"))

  # expect correct paste0 procedure in if else
  expect_equal(rx_with_any_case("abc"), new_rx("(?i)abc"))

  # expect match
  expect_true(grepl(rx() %>% rx_find(value = "ABC") %>% rx_with_any_case(), "abc"))


})
