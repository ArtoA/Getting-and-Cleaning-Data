library(data.table)

# file paths
features.txt <- "./UCI HAR Dataset/features.txt"

subject_test.txt <- "./UCI HAR Dataset/test/subject_test.txt"
X_test.txt <- "./UCI HAR Dataset/test/X_test.txt"
y_test.txt <- "./UCI HAR Dataset/test/y_test.txt"

subject_train.txt <- "./UCI HAR Dataset/train/subject_train.txt"
X_train.txt <- "./UCI HAR Dataset/train/X_train.txt"
y_train.txt <- "./UCI HAR Dataset/train/y_train.txt"

# features & selected features
features.data <- fread(features.txt, header=F) 
features.selected <- features.data[V2 %like% "mean\\(\\)|std\\(\\)"] 

# read train data
subject_train.data <- fread(subject_train.txt, header=F)
X_train.data <- read.table(X_train.txt, header=F) # for some reason fread crashes here
y_train.data <- fread(y_train.txt, header=F) 

# column train names
colnames(X_train.data) <- features.data$V2
setnames(y_train.data, "V1", "Label")
setnames(subject_train.data, "V1", "Subject")

# select columns and combine
X_train.selected <- X_train.data[, features.selected$V2]
train <- cbind(X_train.selected, y_train.data, subject_train.data)

# remove train data
rm("subject_train.data", "X_train.data", "y_train.data", "X_train.selected")

# read test data
subject_test.data <- fread(subject_test.txt, header=F)
X_test.data <- read.table(X_test.txt, header=F) # for some reason fread crashes here
y_test.data <- fread(y_test.txt, header=F) 

# test column names
colnames(X_test.data) <- features.data$V2
setnames(y_test.data, "V1", "Label")
setnames(subject_test.data, "V1", "Subject")

# select columns and combine
X_test.selected <- X_test.data[, features.selected$V2]
test <- cbind(X_test.selected, y_test.data, subject_test.data)

# remove features data
rm("features.data", "features.selected")

# remove test data
rm("subject_test.data", "X_test.data", "y_test.data", "X_test.selected")

# combine test & train
data <- rbind(train,test)

# label names
labelNames <- c("Walking", "Walking upstairs", "Walking downstairs", "Sitting", "Standing", "Laying")
for(i in 1:6) data$Label[data$Label== i] <- labelNames[i]

#aggregate and print
tidyData <- aggregate(. ~ Subject + Label, data, mean)
write.table(tidyData, file="tidyData.txt", row.names=FALSE)
