context("test-rx_with_any_case")

test_that("with_any_case modifier works", {

  # expect match
  expect_true(grepl(rx() %>% rx_find(value = "ABC") %>% rx_with_any_case(), "abc"))


})
