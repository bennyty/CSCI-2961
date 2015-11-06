require(graphics)
library(arules)
library(arulesViz)
#Titan <- read.csv("~/Hacks/CSCI Open Source/R/TitanNoRandomNumbers.csv", header = TRUE)
# mosaicplot(Titan, main = "Survival on the Titanic")
df <- as.data.frame(Titanic)
titanic.raw <- NULL
for (i in 1:4) {
  titanic.raw <-
    cbind(titanic.raw, rep(as.character(df[,i]), df$Freq))
}
titanic.raw <- as.data.frame(titanic.raw)
names(titanic.raw) <- names(df)[1:4]
dim(titanic.raw)
rules.all <- apriori(titanic.raw)
rules <- apriori(
  titanic.raw, control = list(verbose = F),
  parameter = list(
    minlen = 2, supp = 0.005, conf = 0.8
  ),
  appearance = list(
    rhs = c("Survived=No", "Survived=Yes"),
    default = "lhs"
  )
)
quality(rules) <- round(quality(rules), digits = 3)
rules.sorted <- sort(rules, by = "lift")
subset.matrix <- is.subset(rules.sorted, rules.sorted)
subset.matrix[lower.tri(subset.matrix, diag = T)] <- NA
redundant <- colSums(subset.matrix, na.rm = T) >= 1
which(redundant)
# remove redundant rules
rules.pruned <- rules.sorted[!redundant]
inspect(rules.pruned)
plot(rules.all, method = "grouped", interactive = TRUE)