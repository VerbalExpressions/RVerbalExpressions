context("test-rx_anything_but")

test_that("anything_but rule works", {
  # exoect the correct output
  expect_equal(rx() %>% rx_anything_but("abc"), new_rx("[^abc]*"))
  expect_equal(rx() %>% rx_anything_but("abc", mode="lazy"), new_rx("[^abc]*?"))

  # expect an error if nothing is given
  expect_error(rx() %>% rx_anything_but(NULL))

  # expect an error if invalid 'mode' is given
  expect_error(rx() %>% anything_but("abc", mode = "whatever"))

  # expect .data works
  expect_equal(rx_start_of_line() %>% rx_anything_but("abc"), new_rx("^[^abc]*"))
  expect_equal(rx_start_of_line()%>% rx_anything_but("abc", mode = "lazy"), new_rx("^[^abc]*?"))
})
