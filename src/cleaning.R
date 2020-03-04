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
  return(train)
}


clean<-function(base, columns)
{
  #print(columns[1])
  clean <- filter(base, columns[,1] != "", columns[,2] != "")
  return(clean)
}
print(paste(getwd(),"/Documents/microsoft/R/transparance_sante/", sep=""))