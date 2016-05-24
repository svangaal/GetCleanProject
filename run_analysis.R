setwd("/Users/svangaal/Documents/Coursera/DataSci GettingData/GetCleanProject/")
library(plyr)

# Load variable names
varnamefile <- "./features.txt"
varnames <- readLines(varnamefile)

# Manually add names of subject and activity
varnames <- c("subject","activity",varnames)

# Define fixed width format
setwidths <- rep(c(16),each=561)

# Identify variables that contain mean or standard deviation "std"
# Also keep columns 1 and 2 which are held for subject and activity
meancol <- grep("mean\\(",varnames)
stdcol <- grep("std\\(",varnames)
keepcol <- sort(c(1,2,meancol,stdcol))

# Load test data sets
testsubjfile <- "./test/subject_test.txt"
testsetfile <- "./test/X_test.txt"
testlabelfile <- "./test/y_test.txt"

testset <- read.fwf(testsetfile,setwidths)
testsubj <- read.csv(testsubjfile,header = FALSE,sep = " ")
testlabel <- read.csv(testlabelfile, header = FALSE)

# Load train data sets
trainsubjfile <- "./train/subject_train.txt"
trainsetfile <- "./train/X_train.txt"
trainlabelfile <- "./train/y_train.txt"

trainset <- read.fwf(trainsetfile,setwidths)
trainsubj <- read.csv(trainsubjfile, header = FALSE, sep = " ")
trainlabel <- read.csv(trainlabelfile,header = FALSE)

# Bind subject labels and activity types then merge train and test sets
testset <- cbind(testsubj,testlabel,testset)
trainset <- cbind(trainsubj,trainlabel,trainset)
fullset <- rbind(testset,trainset)

# Add column names to data set
colnames(fullset) <- varnames

# Keep mean and standard deviation columns
fullset <- fullset[keepcol]

# Change activity and subject to factors and label
fullset$subject <- as.factor(fullset$subject)
fullset$activity <- as.factor(fullset$activity)
fullset$activity <- revalue(fullset$activity,c("1"="walking",
                                               "2"="walkingup",
                                               "3"="walkingdown",
                                               "4"="sitting",
                                               "5"="standing",
                                               "6"="laying"))

# Create table of mean values by subject and activity
aggmeans <- aggregate(fullset, by=list(fullset$subject,fullset$activity),
                      FUN = mean)
aggmeans <- aggmeans[c(-3,-4)]
colnames(aggmeans)[1] <- "subject"
colnames(aggmeans)[2] <- "activity"