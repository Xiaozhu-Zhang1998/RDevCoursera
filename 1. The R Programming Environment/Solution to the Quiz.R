library(dplyr)
library(tidyr)
library(readr)
library(readxl)
library(magrittr)
data <- read_csv("./daily_SPEC_2014.csv.bz2")

## ==========
## Question 1
data1 <- data  %>%
  filter(`State Name` == 'Wisconsin',
         `Parameter Name` == 'Bromine PM2.5 LC')  %>%
  summarise(avg = mean(`Arithmetic Mean`, na.rm = T))

data1
# A tibble: 1 x 1
#         avg
#       <dbl>
#   1 0.00396


## ==========
## Question 2
data2 <- data  %>%
  group_by(`Parameter Name`)  %>%
  summarise(avg = mean(`Arithmetic Mean`))  %>%
  arrange(desc(avg))

head(data2, 1)
# A tibble: 1 x 2
#     `Parameter Name`           avg
#     <chr>                    <dbl>
#   1 Sample Max Baro Pressure  745.

## Note: there may be something wrong with the given choices? 
## Try group_by(`Parameter Name`,`State Name`,`Site Num`,`Date Local`)
## instead of group_by(`Parameter Name`)


## ==========
## Question 3
data3 <- data %>%
  filter(`Parameter Name` == 'Sulfate PM2.5 LC')  %>%
  group_by(`State Code`,`County Code`,`Site Num`)  %>%
  summarise(avg = mean(`Arithmetic Mean`))  %>%
  arrange(desc(avg))

head(data3, 1)
# A tibble: 1 x 4
# Groups:   State Code, County Code [1]
#       `State Code` `County Code` `Site Num`   avg
#             <dbl>         <dbl> <chr>      <dbl>
#   1           39            81 0017        3.18


## ==========
## Question 4
data4 <- data %>%
  filter(`Parameter Name` == 'EC PM2.5 LC TOR') %>%
  group_by(`State Name`) %>%
  summarise(avg = mean(`Arithmetic Mean`)) %>%
  filter(`State Name` %in% c('California','Arizona'))

abs(data4[1,2] - data4[2,2])
#          avg
# 1 0.01856696


## ==========
## Question 5
data5 <- data %>%
  filter(`Parameter Name` == 'OC PM2.5 LC TOR',
         Longitude < -100) %>%
  summarise(median = median(`Arithmetic Mean`)) 

head(data5, 1)
# A tibble: 1 x 1
#     median
#      <dbl>
#   1   0.43


## ==========
## Question 6
sites <- read_excel("./aqs_sites.xlsx")
data6 <- sites %>%
  filter(`Land Use` == 'RESIDENTIAL',
         `Location Setting` == 'SUBURBAN') %>%
  summarise(n = n())

head(data6, 1)
# A tibble: 1 x 1
#         n
#     <int>
#   1  3527


## ==========
## Question 7
## Preprocessing
str(data[1:3])
str(sites[1:3])
data$`State Code` <- as.numeric(data$`State Code`)
data$`County Code`<- as.numeric(data$`County Code`)
data$`Site Number` <- as.numeric(data$`Site Num`)
## Join
tbl_joined <- left_join(data, sites)
## Subset
data7 <- tbl_joined  %>%
  filter(`Parameter Name` == 'EC PM2.5 LC TOR',
         `Land Use` == 'RESIDENTIAL',
         `Location Setting` == 'SUBURBAN',
         Longitude >= -100)  %>% 
  summarize(median = median(`Arithmetic Mean`)) 

head(data7, 1)
# A tibble: 1 x 1
#     median
#      <dbl>
#   1   0.56

## Note: Something seems wrong with the given choices again...
## The answer key is 0.6100. Any suggestions?


## ==========
## Question 8
library(lubridate)
data8 <- tbl_joined  %>%
  filter(`Parameter Name` == 'Sulfate PM2.5 LC',
         `Land Use` == 'COMMERCIAL')  %>% 
  group_by(month(`Date Local`))  %>%
  summarize(avg = mean(`Arithmetic Mean`)) %>%
  arrange(desc(avg))

head(data8, 1)
# A tibble: 1 x 2
#     `month(\`Date Local\`)`   avg
#                       <dbl> <dbl>
#   1                       2  2.01


## ==========
## Question 9
data9 <- tbl_joined  %>%
  filter(`Parameter Name` %in% c('Sulfate PM2.5 LC',
                                 'Total Nitrate PM2.5 LC'),
         `State Code` == '6', `County Code` == 65,
         `Site Number` == 8001)  %>% 
  # date avg
  group_by(`Parameter Name`,`Date Local`) %>%
  summarize(avg = mean(`Arithmetic Mean`)) %>%
  # sum
  group_by(`Date Local`)  %>%
  summarize(sum = sum(avg)) %>%
  filter(sum > 10)  %>%
  summarise(n = n())

head(data9, 1)
# A tibble: 1 x 1
#         n
#     <int>
#   1    11
  

## ==========
## Question 10
data10 <- tbl_joined  %>%
  filter(`Parameter Name` %in% c('Sulfate PM2.5 LC',
                                 'Total Nitrate PM2.5 LC'))  %>% 
  # date avg
  group_by(`Parameter Name`, `Date Local`,
           `State Code`,`County Code`,`Site Number`)  %>%
  summarize(avg = mean(`Arithmetic Mean`))  %>%
  # spread  
  spread(`Parameter Name`, avg) %>%
  # cor
  group_by(`State Code`,`County Code`,`Site Number`) %>%
  summarize(cor = cor(`Sulfate PM2.5 LC`, `Total Nitrate PM2.5 LC`)) %>%
  arrange(desc(cor)) 
  
head(data10, 1)
# A tibble: 1 x 4
# Groups:   State Code, County Code [1]
#     `State Code` `County Code` `Site Number`   cor
#            <dbl>         <dbl>         <dbl> <dbl>
#   1            2            90            35 0.898
