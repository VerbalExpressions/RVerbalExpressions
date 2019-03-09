context("test-rx_avoid")

test_that("negative lookarounds work", {

  # expect match
  expect_false(grepl(rx() %>% rx_avoid_prefix("USD") %>% rx_digit(), "USD1", perl = TRUE))
  expect_false(grepl(rx() %>% rx_digit() %>% rx_count(3) %>% rx_avoid_suffix(" km"), "100 km", perl = TRUE))

})
