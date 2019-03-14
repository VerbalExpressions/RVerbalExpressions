is.rx_string <- function(x){
  inherits(x, "rx_string")
}

new_rx <- function(x){
  if(is.rx_string(x)) return(x)
  class(x) <- c("rx_string", class(x))
  x
}

parse_rep <- function(n){
  if(is.null(n)) return(n)

  if(inherits(n, "numeric")){
    n <- as.integer(n)

    if(length(n)>1){
      n[is.na(n)]<-""
      return(paste0("{", n[1], "," , n[length(n)], "}"))
    }
   return(paste0("{", n,"}"))
  }

  switch(n,
         any = '*',
         some = '+',
         maybe = '?',
         stop("Please provide valid number of repetitions"))

}


parse_rep_mode <- function(rep, mode){
  res <- parse_rep(rep)
  #if(rep %in% c("any", "some", "maybe"))
  if (!is.null(rep))
    switch(mode,
           greedy = res,
           lazy = paste0(res, '?'),
           possessive = paste0(res, '+'),
           stop("Invalid mode. Please indicate 'greedy', 'lazy' or 'posessive'")
           )
}

parse_negate <- function(negate, p, ip=NULL){
  if (!is.logical(negate))
     stop("negate accepts either TRUE (don't match characters) or FALSE (default, match characters")
  if(!negate) return(paste0(p))
  if(!missing(ip)) return(paste0(ip))
  paste0("[", "^", peel_set(p), "]")
}


peel_set <- function(x) {
  gsub("^\\[|\\]$", "",x)
}

wrap_set <- function(x) {
  paste0("[", x, "]")
}

