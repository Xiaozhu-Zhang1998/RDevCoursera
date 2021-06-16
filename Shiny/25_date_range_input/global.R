# create sample data frame with dates
set.seed(121)
mydate <- seq(Sys.Date(), by = "day", length.out = 30)
mystatus <- sample(c("Completed", "Cancelled"), 30, replace = TRUE)
mydf <- data.frame(Date = mydate, Status = mystatus)

# read from csv file
dates <- read.csv("dates.csv", header = TRUE, stringsAsFactors = FALSE)
dates$Date <- as.Date(dates$Date, format = "%Y-%m-%d")