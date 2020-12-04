library(EpiSim)

file.name <- file.choose()

sheet.names = list(
  initial.conditions = "Initial conditions",
  parms.notime.0d = "Parameters any time any age",
  parms.0d = "Parameters any age",
  parms.1d = "Parameters by Age",
  parms.2d = "Parameters by Age x Age",
  model.flow ="Model Specs (not lazy)(MathExce",
  auxiliary.vars = "Intermediate calculations",
  post.processing = "Post Processing"
)

hypercube.specs <- read.hypercube.sampling.specs(
  file.name,
  sheet = "HyperCube Sampling Specs"
)

parm.cloud.grid.specs <- list(
  hypercube.lower.bounds = hypercube.specs$lower.bound,
  hypercube.upper.bounds = hypercube.specs$upper.bound,
  hypercube.apex.mode    = hypercube.specs$apex , # To be commented if uniform
  n.repeat.within.hypercube = 100, # 10000, icitte
  LatinHypercubeSampling = c(FALSE, TRUE)[2],
  racine = 123,
  backend.transformation = function(x) {x}, # Need to provide a function like exp here
  reference.alteration = c("overwrite", "add", "multiply")[1],
  tmin.alter.scope = 0:1000
)

results.baseline <- seir.n.age.classes(
  file.name,
  sheet.names
)

various.parms.result <- try.various.parms.values(
  results.baseline,
  parm.cloud.grid.specs
)
