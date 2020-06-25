# Load packages
library(devtools)
library(klippy)
library(NCmisc)
library(roxygen2)

# Create package
create(path = "c:/users/joel/google drive/github/no.name")

# Customize the DESCRIPTION file
use_description(fields = list(
	Language = "en",
	Title = "Fit Box/Compartment Models Via Excel",
	Version = "12.01",
	Description = "This package enables users to fit box/compartment models via an Excel workbook. ODE (ordinary differential equation) or CTMC (continuous-time Markov chain) models can be fitted. ODE models can be fitted for multiple age groups. This package also provides tools for users to perform sensitivity analsyes/parameter sweeps on their models and to visualize model results.",
	`Authors@R` = c(
		person(given = "Claude", family = "Nadeau", email = "claude.nadeau.statcan@gccollaboration.ca", role = c("aut", "cre")),
		person(given = "Maikol", family = "Diasparra", email = "maikol.diasparra.statcan@gccollaboration.ca", role = c("aut")),
		person(given = "Joel", family = "Barnes", email = "joel.barnes.statcan@gccollaboration.ca", role = c("aut"), comment = c(ORCID = "0000-0002-7621-9020")),
		person(given = "Deirdre", family = "Hennessy", email = "deirdre.hennessy.statcan@gccollaboration.ca", role = c("aut")),
		person(given = "Rochelle", family = "Garner", email = "rochelle.garner.statcan@gccollaboration.ca", role = c("aut"))
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
use_package("lhs", "Imports")
use_package("magrittr", "Imports")
use_package("openxlsx", "Imports")
use_package("plotly", "Imports")
use_package("readxl", "Imports")
use_package("scales", "Imports")
use_package("tidyr", "Imports")
use_package("triangle", "Imports")

# Add suggested packages to the DESCRIPTION file
use_package("klippy", "Suggests")
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
library(lhs)
library(magrittr)
library(openxlsx)
library(plotly)
library(readxl)
library(scales)
library(tidyr)
library(triangle)
functions1 <- list.functions.in.file("c:/users/joel/google drive/github/no.name/r/plotting.functions.R")
functions2 <- list.functions.in.file("c:/users/joel/google drive/github/no.name/r/seir.functions.R")

# Create demo data
load("c:/users/joel/google drive/github/r-package-sources/no.name-demo-data.RData")
no.name.demo <- list(parameters = parms.tried.df, results = outcomes.summary.df)
use_data(no.name.demo)

# Run a check on the package
check()

# Build vignettes
build_vignettes()

# Build package
build()

# Build PDF manual
#tinytex::install_tinytex()
library(tinytex)
tinytex:::is_tinytex()
Sys.which("pdflatex")

build_manual("c:/users/joel/google drive/github/no.name", path = "c:/users/joel/google drive/github/r-package-sources")
