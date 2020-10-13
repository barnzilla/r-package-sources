# Load packages to extend base R
library(dplyr); library(kableExtra); library(stringr); library(tools)

# Set the working directory to the location of the package documentation files
setwd("c:/users/joelb/google drive/github/capl/Man")

# Create a list of the function files
function_names <- list.files(getwd())

# Create a table and add the function names
function_table <- tibble(
  Name = gsub(".Rd", "()", function_names),
  Description = rep("", length(function_names))
)

# Add the descriptions and remove unneeded code
for(i in 1:length(function_names)) {
  connection = file(function_names[i], open = "r")
  documentation = readLines(connection)
  close(connection)

  starting_element <- which(str_detect(documentation, "description[{]")) + 1

  description <- c()
  for(j in starting_element:length(documentation)) {
    if(isTRUE(str_detect(documentation[j], "[}]")) & nchar(documentation[j]) == 1) {
      break
    } else {
      description <- append(description, documentation[j])
    }
  }
  function_table$Description[i] <- paste(description, collapse = " ")
}

for(i in 1:nrow(function_table)) {
  row <- unlist(strsplit(function_table$Description[i], " "))
  description <- c()
  for(j in 1:length(row)) {
    description <- append(description, gsub("?(f|ht)tp(s?)://(.*)[.][a-z]+|[{]|[}]|[\\]|href|code", "", row[j]))
  }
  function_table$Description[i] <- paste(description, collapse = " ")
}

# Render HTML table
kable(function_table)
