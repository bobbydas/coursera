complete <- function(directory, id = 1:332) {
  ## directory is character vector of lentth 1 indicating the
  ## location of CSV files

  ## id is an integer vector indicating monitor id to be used

  ## Return the data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'ID' is the monitor id number and nobs is
  ## the number of complete cases

  ## Set path and working directory
  path <- paste(getwd(),"/",directory, sep="")
  setwd(path)

  ## Initialize final data frame
  df <- data.frame()

  ## Vector of all file names
  csv_files <- list.files(pattern = "*.csv")

  for (i in id) {
    monitor_data <<- read.csv(csv_files[i])

    ## Calculate number of complete cases
    nobs <- sum(complete.cases(monitor_data))

    temp_df <- data.frame(i,nobs)
    df <- rbind(df,temp_df)
    }

  ## create matrix of complete cases
  names(df)=c('id','nobs')

  ## revert working directory
  setwd("../")

  ## Return data frame with results
  df

}
