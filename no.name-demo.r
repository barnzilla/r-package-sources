# Install sweepr package
devtools::install_github("barnzilla/sweepr", upgrade = "never")

# Load sweepr package
library(sweepr)

# Get full path to demo model (in Excel workbook) that comes with the sweepr package
model.1.workbook <- get.path("demo.1.xls")

# Define workbook sheet names
sheet.names <- list(
  parms.notime.0d = "Parameters any time any age",
  parms.0d = "Parameters any age",
  parms.1d = "Parameters by Age",
  parms.2d = "Parameters by Age x Age",
  initial.conditions = "Initial conditions",
  model.flow = "Model Specs (not lazy v1)",
  auxiliary.vars = "Intermediate calculations",
  post.processing = "Post Processing Empty"
)

# Fit model with model.flow = "Model Specs (not lazy v1)"
results.1 <- seir.n.age.classes(model.1.workbook, sheet.names)

# Inspect the model via the $input.info list in the results.1 object
results.1$input.info$model.flow[, c("From", "To", "lazy", "activation", "expression")]
results.1$input.info$auxiliary.vars
results.1$input.info$initial.conditions
results.1$input.info$parms.notime.0d
results.1$input.info$parms.0d
results.1$input.info$parms.1d
results.1$input.info$parms.2d
results.1$input.info$post.processing

# Fit model with model.flow = "Model Specs (lazy)" and post.processing = "Post Processing"
sheet.names$model.flow <- "Model Specs (lazy)"
sheet.names$post.processing <- "Post Processing"
results.2 <- seir.n.age.classes(model.1.workbook, sheet.names)

# Fit model with model.flow = "Model Specs (not lazy v2)"
sheet.names$model.flow <- "Model Specs (not lazy v2)"
results.3 <- seir.n.age.classes(model.1.workbook, sheet.names)

# Fit model with model.flow = "Model Specs (not lazy v3)"
sheet.names$model.flow <- "Model Specs (not lazy v3)"
results.4 <- seir.n.age.classes(model.1.workbook, sheet.names)

