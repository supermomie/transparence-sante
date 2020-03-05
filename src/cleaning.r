library(tidyverse)
x <- c(1, 1, 4, 5, 5, 4, 6,c(1, 1, 3, 4, 4, 6, 6))

x[!duplicated(x)]


# Split DB in two (trainset, testset)
splitdb<-function(base, n) # base db , n %
{
  data(base)
  
  ## n% of the sample size
  smp_size <- floor(n * nrow(base))
  
  ## set the seed to make your partition reproducible
  set.seed(123)
  train_ind <- sample(seq_len(nrow(base)), size = smp_size)
  
  train <- base[train_ind, ]
  #test <- base[-train_ind]
  return(train)
}


clean<-function(base)
{
  #return(data.frame(lapply(base, function(v) {
  #  if (is.character(v)) return(toupper(v))
  #  else return(v)
  #})))
  #array <- list(base)
  #rint(array)
  #return(array)
  #return(mutate_all(base, funs=toupper))
  #trim <- function (x) gsub("^\\s+|\\s+$", "", x)
  c <- data.frame(lapply(base, function(v) {
    #print(typeof(v))
    #print(v)
    #if (v == "") {
    #  return(base[-which(v == ""), ])
    #}
    if (is.character(v)) {
      trim <- trimws(v)
      d <- mutate_all(trim, funs=toupper)
      print('un')
      return(d)
    }
    else {
      print('deux')
      return(v)
    }
  }))
  #print(c)
  return(c)
  
  #return(data.frame(lapply(base,2,toupper)))
  #return(tolower(base)[!duplicated(tolower(base))])
  #return(print(tolower(columns[1])))
  
  #clean <- filter(base, columns[,1] != "", columns[,2] != "")
  #return(clean)
}