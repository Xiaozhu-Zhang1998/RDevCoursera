## Basic inferential data analysis

## Load the ToothGrowth data -----
# chunk 1
library("datasets")
data("ToothGrowth")
dim(ToothGrowth)
head(ToothGrowth)


## Data Summary ----
# chunk2
dat <- ToothGrowth
dat$dose <- factor(dat$dose)
summary(dat)


# chunk 3
library(ggplot2)
library(ggridges)
ggplot(dat, aes(x = len, y = factor(supp), fill = supp)) +
  geom_density_ridges(alpha = 0.8) +
  labs(title = "Density of 'len' over supplement types", x = "len", y = "supp") +
  theme_classic()

ggplot(dat, aes(x = len, y = factor(dose), fill = dose)) +
  geom_density_ridges(alpha = 0.8) + 
  labs(title = "Density of 'len' over dose levels", x = "len", y = "dose") + 
  theme_classic()


# Tests ----
# chunk 4
# Tests of supp
len_OJ <- subset(dat, supp %in% "OJ")$len
len_VC <- subset(dat, supp %in% "VC")$len
t.test(len_OJ, len_VC, paired = FALSE, var.equal = FALSE, alt = "two.sided")


# chunk 5
# Tests of dose
len_.5 <- subset(dat, dose %in% "0.5")$len
len_1 <- subset(dat, dose %in% "1")$len
len_2 <- subset(dat, dose %in% "2")$len
matrix <- cbind(len_.5, len_1, len_2)
library("combinat")
tab <- combn(3,2)
pValues <- c()
for(i in 1:3){
  a <- matrix[,tab[,i][1]]
  b <- matrix[,tab[,i][2]]
  t <- t.test(a, b, paired = FALSE, var.equal = FALSE, alt = "two.sided")$p.value
  pValues <- c(pValues, t)
}
pValues
p.adjust(pValues, method = "bonferroni")
p.adjust(pValues, method = "BH")

