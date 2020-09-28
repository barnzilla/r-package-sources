# Install no.name package
devtools::install_github("barnzilla/no.name", upgrade = "never")

# Load no.name package
library(no.name)

# Get full path to demo model (in Excel workbook) that comes with the no.name package
model.1.workbook <- get.path("demo.model.1.xls")

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

# Inspect the results
head(results.1$solution)
get.scatter.plot(results.1$solution$time, results.1$solution$Left)
results.1$sommaire # The summary is empty because post.processing = "Post Processing Empty"

# Fit model with model.flow = "Model Specs (lazy)" and post.processing = "Post Processing"
sheet.names$model.flow <- "Model Specs (lazy)"
sheet.names$post.processing <- "Post Processing"
results.2 <- seir.n.age.classes(model.1.workbook, sheet.names)

# Inspect the results
cat(paste(results.2$input.info$post.processing$code, collapse = "\n"))
head(results.2$solution) # Note additional content (i.e., the Theoretical.Right vector)
results.2$sommaire # Numerical solution agrees fairly well with theory

# Do results.1 (not lazy v1) and results.2 (lazy) lead to the same numerical answer? Yes, with rounding errors
range(results.1$solution - results.2$solution[c("time", "Left", "Right")])

# Fit model with model.flow = "Model Specs (not lazy v2)"
sheet.names$model.flow <- "Model Specs (not lazy v2)"
sheet.names$post.processing = "Post Processing Empty"
results.3 <- seir.n.age.classes(model.1.workbook, sheet.names)

# Do results.3 (not lazy v2) and results.2 (lazy) lead to the same numerical answer? Yes, with rounding errors
range(results.3$solution - results.2$solution[c("time", "Left", "Right")])

# Fit model with model.flow = "Model Specs (not lazy v3)"
sheet.names$model.flow <- "Model Specs (not lazy v3)"
sheet.names$post.processing = "Post Processing Empty"
results.4 <- seir.n.age.classes(model.1.workbook, sheet.names)

# Do results.4 (not lazy v3) and results.2 (lazy) lead to the same numerical answer? Yes, exactly (hints at what the lazy model does)
range(results.4$solution - results.2$solution[c("time", "Left", "Right")])
