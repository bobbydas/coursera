corr <- function(directory, threshold = 0) {
  ## 'directory' is character vector of lentth 1 indicating the
  ## location of CSV files

  ## 'threshold' is a numeric vector of length 1 indicating
  ## the number of completely observed observations (on all
  ## varuables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0

  ## Return a numberic vector of correlations
  ## NOTE: Do not round the result !


  ## Initialize vector
  co <- vector()

  ## Matrix of IDs and number of complete cases
  index <- complete("specdata")

  ## define a subset data frame which meets threshold value
  monitor_set <- subset(index, index$nobs > threshold)

  ## Set path and working directory
  path <- paste(getwd(),"/",directory, sep="")
  setwd(path)

  ## Vector of all file names
  csv_files <- list.files(pattern = "*.csv")

  ## For monitors that meet condition read data to calculate correlation
  for (i in monitor_set$id) {
    monitor_data <- read.csv(csv_files[i])

    ## Use only complete cases
    x <- monitor_data[, 2]
    y <- monitor_data[, 3]
    corr <- cor(x, y, use = "complete.obs")
    ##    n <- matrix(c(complete_data$nitrate,complete_data$sulfate))

    ## Calculate correlation of nitrate and sulfate
    co <- c(co, corr)
  }

  ## revert working directory
  setwd("../")

  ## Return data frame with results
  return(co)

}
