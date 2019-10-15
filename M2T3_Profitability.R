# upload existingproducts
library(readr)
existingproductattributes2017 <- read.csv(file="C:/Users/Splendora/OneDrive/Ubiqum/Module_2_Task_3_Blackwell_Prediction/existingproductattributes2017.csv", header = TRUE, sep = ",")

# dummify the data
library(caret)
library(lattice)
library(ggplot2)
newDataFrame <- dummyVars("~.", data = existingproductattributes2017)
existingproducts <- data.frame(predict(newDataFrame, newdata = existingproductattributes2017))

# check data
str(existingproducts)
existingproducts$ProductType.Accessories <- as.integer(existingproducts$ProductType.Accessories)
existingproducts$ProductType.Display <- as.integer(existingproducts$ProductType.Display)
existingproducts$ProductType.ExtendedWarranty <- as.integer(existingproducts$ProductType.ExtendedWarranty)
existingproducts$ProductType.GameConsole <- as.integer(existingproducts$ProductType.GameConsole)
existingproducts$ProductType.Laptop <- as.integer(existingproducts$ProductType.Laptop)
existingproducts$ProductType.Netbook <- as.integer(existingproducts$ProductType.Netbook)
existingproducts$ProductType.PC <- as.integer(existingproducts$ProductType.PC)
existingproducts$ProductType.Printer <- as.integer(existingproducts$ProductType.Printer)
existingproducts$ProductType.PrinterSupplies <- as.integer(existingproducts$ProductType.PrinterSupplies)
existingproducts$ProductType.Smartphone <- as.integer(existingproducts$ProductType.Smartphone)
existingproducts$ProductType.Software <- as.integer(existingproducts$ProductType.Software)
existingproducts$ProductType.Tablet <- as.integer(existingproducts$ProductType.Tablet)
existingproducts$ProductNum <- as.integer(existingproducts$ProductNum)
existingproducts$x5StarReviews <- as.integer(existingproducts$x5StarReviews)
existingproducts$x4StarReviews <- as.integer(existingproducts$x4StarReviews)
existingproducts$x3StarReviews <- as.integer(existingproducts$x3StarReviews)
existingproducts$x2StarReviews <- as.integer(existingproducts$x2StarReviews)
existingproducts$x1StarReviews <- as.integer(existingproducts$x1StarReviews)
existingproducts$PositiveServiceReview <- as.integer(existingproducts$PositiveServiceReview)
existingproducts$NegativeServiceReview <- as.integer(existingproducts$NegativeServiceReview)
existingproducts$BestSellersRank <- as.ordered(existingproducts$BestSellersRank)
summary(existingproducts)
is.na(existingproducts)

# remove attribute with missing data
existingproducts$BestSellersRank <- NULL

# create correlation matrix
corr_existingproducts <- cor(existingproducts)
corr_existingproducts

# install and load corrplot to visualize correlation matrix
install.packages("corrplot")
library(corrplot)

# Visualize correlation matrix of all attributes
corrplot(corr_existingproducts, order = "alphabet", method = "color", addCoef.col = "gray")
corrplot(corr_existingproducts, type = "upper", order = "AOE", method = "ellipse")

# remove negative correlating attributes
existingproducts$ProductType.PrinterSupplies <- NULL
existingproducts$ProductType.Tablet <- NULL
existingproducts$ProductHeight <- NULL
existingproducts$ProductDepth <- NULL
existingproducts$ProductNum <- NULL
existingproducts$ProductType.Software <- NULL
existingproducts$ProductType.Accessories <- NULL
summary(existingproducts)
corr_existingproducts <- cor(existingproducts)
corr_existingproducts
corrplot(corr_existingproducts, type = "upper", order = "AOE", method = "color", addCoef.col = "gray")

existingproducts$ProductType.GameConsole <- NULL
existingproducts$PositiveServiceReview <- NULL
existingproducts$ProductType.ExtendedWarranty <- NULL
existingproducts$Recommendproduct <- NULL
existingproducts$ProfitMargin <- NULL
existingproducts$ProductType.Smartphone <- NULL
existingproducts$ProductType.Laptop <- NULL
existingproducts$ProductType.Netbook <- NULL
existingproducts$Price <- NULL
existingproducts$ProductType.PC <- NULL
existingproducts$ShippingWeight <- NULL
existingproducts$ProductType.Display <- NULL
existingproducts$ProductType.Printer <- NULL
existingproducts$ProductWidth <- NULL
summary(existingproducts)
corr_existingproducts <- cor(existingproducts)
corr_existingproducts
corrplot(corr_existingproducts, type = "upper", order = "AOE", method = "color", addCoef.col = "gray")

existingproducts$x5StarReviews <- NULL
existingproducts$x2StarReviews <- NULL
summary(existingproducts)
corr_existingproducts <- cor(existingproducts)
corr_existingproducts
corrplot(corr_existingproducts, type = "upper", order = "AOE", method = "color", addCoef.col = "gray")

