# Load packages
library(devtools)
library(NCmisc)
library(roxygen2)

# Create package
create(path = "c:/users/joel/google drive/github/sweepr")

# Customize the DESCRIPTION file
use_description(fields = list(
	Language = "en",
	Title = "Run Parameter Sweeps on SEIR Models",
	Version = "0.11.6",
	Description = "Runs SEIR model and performs parameter sweeps on SEIR model output.",
	`Authors@R` = c(
		person("Claude", "Nadeau", email = "claude.nadeau.statcan@gccollaboration.ca", role = c("aut")),
		person("Maikol", "Diasparra", email = "maikol.diasparra.statcan@gccollaboration.ca", role = c("aut")),
		person("Joel", "Barnes", email = "joel.barnes.statcan@gccollaboration.ca", role = c("aut", "cre"), comment = c(ORCID = "0000-0002-7621-9020")),
		person("Deirdre", "Hennessy", email = "deirdre.hennessy.statcan@gccollaboration.ca", role = c("aut")),
		person("Rochelle", "Garner", email = "rochelle.garner.statcan@gccollaboration.ca", role = c("aut"))
	),
	Depends = "R (>= 2.10)",
	VignetteBuilder = "knitr"
))

# Create a license for the package
use_ccby_license(name = "Claude Nadeau; Maikol Diasparra; Joel Barnes; Deirdre Hennessey; Rochelle Garner")

# Add dependencies to the DESCRIPTION file
use_package("adaptivetau", "Imports")
use_package("deSolve", "Imports")
use_package("dplyr", "Imports")
use_package("DT", "Imports")
use_package("forcats", "Imports")
use_package("ggplot2", "Imports")
use_package("htmlwidgets", "Imports")
use_package("janitor", "Imports")
use_package("lhs", "Imports")
use_package("magrittr", "Imports")
use_package("openxlsx", "Imports")
use_package("plotly", "Imports")
use_package("readxl", "Imports")
use_package("scales", "Imports")
use_package("tibble", "Imports")
use_package("tidyr", "Imports")
use_package("triangle", "Imports")

# Add suggested packages to the DESCRIPTION file
use_package("knitr", "Suggests")
use_package("rmarkdown", "Suggests")

# Create documentation
document()

# Find all functions by package for a given file
library(adaptivetau)
library(deSolve)
library(dplyr)
library(DT)
library(forcats)
library(ggplot2)
library(htmlwidgets)
library(janitor)
library(lhs)
library(magrittr)
library(openxlsx)
library(plotly)
library(readxl)
library(scales)
library(tidyr)
library(triangle)
functions1 <- list.functions.in.file("c:/users/joel/google drive/github/sweepr/r/utility_functions.R")
functions2 <- list.functions.in.file("c:/users/joel/google drive/github/sweepr/r/plotting_functions.R")
functions3 <- list.functions.in.file("c:/users/joel/google drive/github/sweepr/r/seir_functions.R")

# Create demo data
sweepr_demo <- list(parameters = parms.tried.df, results = outcomes.summary.df)
use_data(sweepr_demo)

# Run a check on the package
check()

# Build vignettes
build_vignettes()

# Build package
build()