# Install sweepr package
devtools::install_github("barnzilla/sweepr")

# Load sweepr package
library(sweepr)

# The filename to an example spreadsheet that comes with the sweepr package
file_name <- paste0(system.file(package = "sweepr"), "/extdata/model-inputs2.xls")

# The sheetnames containing the initial conditions and parameters for the model
sheet_names <- list(
  initial.conditions = "Initial conditions",
  parms.0d = "Parameters any age",
  parms.1d = "Parameters by Age",
  parms.2d = "Parameters by Age x Age",
  model.flow = "Model Specs (not lazy)",
  auxiliary.vars = "Intermediate calculations",
  post.processing="Post Processing"
)

# Fit a baseline model
baseline_results <- SEIR.n.Age.Classes(file_name, sheet_names)

# Define parameter sweep specs
hypercube_lower_bounds <- list(
  # 0.3, 0.4, 0.5, 0.6, 0.7, 0.8 (contact tracing)
  lambda = seq(0.3, 0.8, 0.1),
  # 0.3, 0.4, 0.5, 0.6, 0.7, 0.8 (case identification/isolation)
  delta  = seq(0.3, 0.8, 0.1), 
  # 3/6, 4/6, 5/6
  Cgg_fudging_multiplier = (3:5)/6  
)
hypercube_upper_bounds <- hypercube_lower_bounds

parm_cloud_grid_specs <- list(
  hypercube.lower.bounds = hypercube_lower_bounds,
  hypercube.upper.bounds = hypercube_upper_bounds,
  n.repeat.within.hypercube = 1,
  # TRUE or FALSE
  LatinHypercubeSampling = TRUE,
  # Seed number so results can be reproduced
  racine = 42,
  # Need to provide a function like exp here
  backend.transformation = function(x) {x},
  # Options include "overwrite", "add" and "multiply"
  reference.alteration = "overwrite",
  tmin.alter.scope = 88
)

# Run the parameter sweep
parameter_sweep_results <- try.various.parms.values(baseline_results, parm_cloud_grid_specs)

# Save different parts of the results
parameters_swept <- parameter_sweep_results$parms.to.try
sweep_list <- parameter_sweep_results$list.sweep
sweep_df <- parameter_sweep_results$df.sweep
outcomes_summary_df <- parameter_sweep_results$outcomes.summary.df

# Save the results
# Creates a file called "This file contains an R object called parameters_swept.SavedFromR".
verbose.save("parameters_swept") 
verbose.save("sweep_list")
verbose.save("sweep_df")
verbose.save("outcomes_summary_df")