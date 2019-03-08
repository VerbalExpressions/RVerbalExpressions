context("test-rx_not")

test_that("not rule works", {

  # expect minimal output
  expect_equal(rx_not(value = ""), "(?!)")

  # expect that u is not followed by q
  expect_false(grepl(rx_find(value = "q") %>% rx_not("u"), "qu", perl = TRUE))
  expect_true(grepl(rx_find(value = "q") %>% rx_not("u"), "qa", perl = TRUE))

})
