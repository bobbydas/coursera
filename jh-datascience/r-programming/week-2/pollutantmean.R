## Function pollutantmean that takes three inputs directory, pollutant and is.data.frame

pollutantmean <- function(directory, pollutant, id=1:332) {
  ## 'directory' is a character vector of length 1 indicating the location
  ## of the CSV files

  ## 'pollutant' is a character vector of length 1 indicating the name
  ## of the pollutant for which we will calculate the mean;
  ## either "sulphate" or "nitrate"

  ## 'id' is an integer vector indicating the monitor ID numbers to be used

  ## Return the mean of the pollutant across all monitors list in the 'id'
  ## vector (ignoring NA values)
  ## NOTE : Result is not rounded.

  ## set working directory to directory with monitor ID files
  dir <- paste(getwd(),"/",directory, sep="")
  setwd(dir);

  ## create a vector of all csv files
  csv_files <- list.files(pattern = "*.csv")

  ## initialize pollutant data vector for defined range. This
  ## will be used to calculate the man for the pollutant
  pollutant_vector <- vector()

  ## read csvs to a data frame
  for (i in id) {
      monitor_data <- read.csv(csv_files[i])

      ## Create a vector of pollutant data
      pollutant_data <- monitor_data[pollutant]

      ## Remove NA values from pollutant data
      clean_pollutant_data <- pollutant_data[!is.na(pollutant_data)]

      pollutant_vector <- c(pollutant_vector,clean_pollutant_data)
  }
## Calculate mean for the specified pollutant
calculated_mean <- mean(pollutant_vector)

## Output value of calculated_mean
print(calculated_mean)

## revert working directory
setwd("../")
}
