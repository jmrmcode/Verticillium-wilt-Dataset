####################################################################
####***COMPARISON BETWEEN BRT and GLM models for V. dahliae occurrence

# install.packages("dismo", DEPENDENCES=T)
# install.packages("gbm", DEPENDENCES=T)
# install.packages("Metrics", DEPENDENCES=T)
# install.packages("plotrix", DEPENDENCES=T)
require("dismo")
require("gbm")
require("Metrics")
require("plotrix")

# import data set
urlfile <- 'https://github.com/jmrmcode/Verticillium-wilt-Dataset/raw/master/VerticilliumWilt_DataSet.csv'
data <- read.csv(urlfile)
data$Watering <- relevel(data$Watering, ref = 2) # set "rainfed" as the reference level for "Watering"
str(data)


# create 10-fold CV blocks
data$ID <- as.numeric(rownames(data))
ii <- sample(1:10, size=nrow(data), replace=TRUE)
data.grouped <- split(data$ID, ii)

##  run the models using the 10 data blocks
f_rownames <- function(x) {paste0("Partition", x)}
rownames <- sapply(c(1:10), FUN = f_rownames)
logloss <- data.frame(matrix(NA, nrow = 10, ncol = 2, dimnames = list(rownames, c("BRT_logloss", "GLM_logloss"))))

## set BRT parameters
tree.complexity <- 1 # set tree.complexity
learning.rate <- 0.01 # set learning.rate
bag.fraction <- 0.75 # set bag fraction

# loop for running the models
for (i in c(1:10)) {
  groups <- c(1:10)[-i]
  trainingdata <- data[unlist(data.grouped[groups]), ]
  testdata <- data[unlist(data.grouped[i]), ]
  
  ## run BRT model
  mod.gbm <- gbm.step(data = trainingdata, gbm.x = c(2:9),
                      gbm.y = 1, family = "bernoulli", tree.complexity = tree.complexity,
                      learning.rate = learning.rate, bag.fraction = bag.fraction)
  
  # compute predictions using test data
  preds <- predict.gbm(mod.gbm, testdata,
                       n.trees=mod.gbm$gbm.call$best.trees, type="response")
  
  # BRT model performance
  BRT_logloss <- logLoss(actual = testdata$Occurrence, predicted = preds)
  logloss[i, 1] <- BRT_logloss
  
  ## run the top-ranked GLM model (see Table 1 in Requena-Mullor et al)
  mod.glm <- glm(Occurrence ~ 1 + Isothermality * Watering + RainfallSeasonality * Isothermality + PlantMaterialOrigin + Area, data = trainingdata,
                 family = binomial(link = "cloglog"))
  
  # GLM model performance
  GLM_logloss <- logLoss(actual = testdata$Occurrence, predicted = predict(mod.glm, testdata, type = "response"))
  logloss[i, 2] <- GLM_logloss
  
}

# print everything together
print(logloss)
print("Mean"); print(apply(logloss, MARGIN = 2, FUN = mean))
print("Standard error"); print(apply(logloss, MARGIN = 2, FUN = std.error))
