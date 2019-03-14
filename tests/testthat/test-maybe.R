context("test-rx_maybe")

test_that("maybe rule works", {

  # expect minimal output
  expect_equal(rx() %>% rx_maybe(value = ""), new_rx("(?:)?"))

  # expect 0 or more match
  expect_true(grepl(rx() %>% rx_maybe(value = "xyz"), "abc"))

  # expect match
  expect_true(rx_start_of_line() %>% rx_find("http") %>%  rx_maybe("s") %>% grepl(x = "http"))

  # expect error when value param is not assigned
  expect_error(rx_maybe())
  expect_error(rx_maybe("abc"))
})

