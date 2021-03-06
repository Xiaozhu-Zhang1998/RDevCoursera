## Exponential distribution and CLT

## Simulation process ----
# chunk 1
lambda = 0.2
n = 40
N = 1000


# chunk 2
set.seed(1234)
Sample <- matrix(rexp(n = n * N, lambda), N, n)
Sample <- apply(Sample, 1, mean)


## Mean comparison ----
# chunk 3
# Theoretical mean
1/lambda
# Sample mean
mean(Sample)


# chunk 4
# figure 1
library(ggplot2)
ggplot(data.frame(Sample), aes(x = Sample)) + 
  geom_histogram(colour = "black", fill = "white", bins = 30) +
  geom_vline(aes(xintercept = 1/lambda),
             color = "blue", linetype = "dashed", size = 0.9) +
  geom_vline(aes(xintercept = mean(Sample)),
             color = "red", linetype = "dashed", size = 0.9) + 
  labs(title = "Histogram of 1000 averages", x = "x")


## Variance comparison ----
# chunk 5
# Theoretical variance
1/(n * lambda^2)
# Sample variance
var(Sample)


# chunk 6
SD <- function(lambda, n, N){
  set.seed(1234)
  Sample <- matrix(rexp(n = n*N, lambda), N, n)
  Sample <- apply(Sample, 1, mean)
  return(list(Sample = Sample))
}
Sp0 <- Sample
Sp1 <- SD(lambda, 100, N)$Sample
Sp2 <- SD(lambda, 150, N)$Sample
Sp <- c(Sp0, Sp1, Sp2)
label <- factor(rep(c("40","100","150"), each = 1000), 
                levels = c("40","100","150"), ordered = TRUE)
# the table
theory_var <- 1/(c(40,100,150)*lambda^2)
sample_var <- c(var(Sp0),var(Sp1),var(Sp2))
dat <- data.frame(theory_var, sample_var)
rownames(dat) <- c("n=40","n=100","n=150")
colnames(dat) <- c("theory_variance", "sample_variance")
dat

# figure 2
ggplot(data.frame(Sp, size = label), aes(x = Sp)) + 
  geom_histogram(aes(fill = size), bins = 30) +
  scale_fill_manual(values=alpha(c("#6495ED","#FFA500","#FF4500"), 0.7)) +
  facet_grid(.~ size) +
  labs(title = "Histogram on different sample sizes", x="x",y="count")


## Distribution ----
# chunk 7
dat <- data.frame(x = rexp(n = 1000, lambda))
ggplot(dat, aes(x = x)) + 
  geom_histogram(colour = "black", fill = "white", bins = 30) +
  labs(title = "Histogram of population", x="x",y="count")


# chunk 8
library("ggpubr")
ggqqplot(Sample)
