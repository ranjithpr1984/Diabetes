#Import the diabetes data available on Blackboard called diabetes-md into a new data frame called my_data

my_data <- read.csv("Diabetes-md.csv")

# Show the structure and class type of my_data
str(my_data)
class(my_data)

my_data$Address[my_data$Address==""] <- NA
my_data$Daibetes.type[my_data$Daibetes.type==""] <- NA
my_data$Status[my_data$Status==""] <- NA

str(my_data)

# Display the missing values in the dataset
sum(is.na(my_data))

#install.packages("mice", dependencies = TRUE)
library("mice")
md.pattern(my_data)

#install.packages("VIM", dependencies = TRUE)
library(VIM)
missing_values <- aggr(my_data,
                       prop = FALSE,
                       numbers = TRUE)
summary(missing_values)

my_data$Daibetes.type <- as.factor(as.character(my_data$Daibetes.type))
my_data$Status <- as.factor(as.character(my_data$Status))
my_data$Address <- as.character(my_data$Address)
str(my_data)

my_na <- my_data[!complete.cases(my_data$Daibetes.type,my_data$Status),]
my_na
nrow(my_na)
nrow(my_data)

full_data <- my_data[complete.cases(my_data$Daibetes.type,my_data$Status),]
nrow(full_data)

full_data$Status <- factor(full_data$Status, ordered = TRUE, levels = c("Poor", "Improved", "Excellent") )

str(full_data)

colnames(full_data) <- c("Patient name","NI address","Type","Age","Health status")

patient_names <- subset(full_data,select = `Patient name`)
#OR patient_names <- full_data[1:1]
print(patient_names)

lapply(full_data,class)
