## create data sets 
test.labels <- read.table("test/y_test.txt", col.names="label")
test.subjects <- read.table("test/subject_test.txt", col.names="subject")
test.data <- read.table("test/X_test.txt")
train.labels <- read.table("train/y_train.txt", col.names="label")
train.subjects <- read.table("train/subject_train.txt", col.names="subject")
train.data <- read.table("train/X_train.txt")


# Merges the training and test data sets
data <- rbind(cbind(test.subjects, test.labels, test.data), cbind(train.subjects, train.labels, train.data))


# Extracts only the measurements on the mean and standard deviation for each measurement
features <- read.table("features.txt", strip.white=TRUE, stringsAsFactors=FALSE)
features.mean.std <- features[grep("mean\\(\\)|std\\(\\)", features$V2), ]
data.mean.std <- data[, c(1, 2, features.mean.std$V1+2)]

# Uses descriptive activity names to name the activities in the data set
labels <- read.table("activity_labels.txt", stringsAsFactors=FALSE)
data.mean.std$label <- labels[data.mean.std$label, 2]

# Appropriately labels the data set with descriptive variable names and tidy the list
good.colnames <- c("subject", "label", features.mean.std$V2)
good.colnames <- tolower(gsub("[^[:alpha:]]", "", good.colnames))
colnames(data.mean.std) <- good.colnames

# find the mean for each combination of subject and label
aggr.data <- aggregate(data.mean.std[, 3:ncol(data.mean.std)], by=list(subject = data.mean.std$subject, label = data.mean.std$label), mean)

# write the data to an output file
write.table(format(aggr.data, scientific=T), "tidydata.txt", row.names=F, col.names=F, quote=2)
