
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
           possessive = paste(res, '+'),
           stop("Invalid mode. Please indicate 'greedy', 'lazy' or 'posessive'")
           )
}
