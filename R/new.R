is.rx_string <- function(x){
  inherits(x, "rx_string")
}

new_rx <- function(x){
  if(is.rx_string(x)) return(x)
  class(x) <- c("rx_string", class(x))
  x
}
