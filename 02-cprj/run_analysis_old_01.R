# Coursera JHPH Data Science
# 003 - 
# Week 3 | Course Project
# Collect and clean, prepare tidy data -- Samsung Galaxy S smartphone accelerometer data
#
# Joe Nguyen | 27 Sep, 2015

# Change working directory
dirBase <- "/home/joe/Documents/A2-Career/A001-learning-development/001-Data-Science/Coursera-Jul2015"
dirWorking <- "/003-clean-data/02-cprj"
setwd(file.path(dirBase, dirWorking))
# rm(list = ls())
# gc(reset = TRUE)

first <- function(x) { x[1] }
last <- function(x) { x[length(x)] }

# harfiles <- unzip("./getdata_projectfiles_UCI HAR Dataset.zip")
numfiles <- length(harfiles)

# Read data from "test" and "train" folders
keywords <- c("test", "train")

# # Find maximum rows and columns to preallocate a data frame
# rows <- numfiles - 4    # manual access
# cols <- 0
# for (i in 1 : numfiles){
#     
#     # Read file if directory contains any keywords
#     match <- grep(paste(keywords, collapse = "|"), harfiles[i])
#     if (length(match) > 0) {
#         temp <- read.table(harfiles[i])
#         temp <- melt(temp)
#         
#         if (nrow(temp) > rows)
#             rows <- nrow(temp)
#         cols <- cols + 1
#     }
# }
# 
# # Initialise data frame
# hardata <- data.frame(matrix(NA, rows, cols))
# 
# # Populate data frame
# for (i in 1 : numfiles){
#     
#     # Read file if directory contains any keywords
#     match <- grep(paste(keywords, collapse = "|"), harfiles[i])
#     if (length(match) > 0) {
#         
#         
#         
#         # Create data table column name
#         splitnames <- strsplit(harfiles[i], "/")
#         varname <- strsplit(last(splitnames[[1]]), ".")
#         
#         hardata[, first(varname) := read.table(harfiles[i])]
#     }
# }
