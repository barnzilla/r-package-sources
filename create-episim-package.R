# Load packages
load_packages <- lapply(c("devtools", "NCmisc", "roxygen2", "tinytex"), require, character.only = TRUE)

# Create package
create(path = "c:/users/joelb/google drive/github/EpiSim")

# Customize the DESCRIPTION file
use_description(fields = list(
  Package = "EpiSim",
	Language = "en",
	Title = "Build multi-compartment models via an Excel workbook",
	Version = "0.12.7",
	Description = "The R package EpiSim enables users to build multi-compartment models (ODE or CTMC) via an Excel workbook which specifies the model structure and age stratification. EpiSim has tools for sensitivity analyses and visualization of model results.",
	`Authors@R` = c(
	  person(
	    given = "Antoinette",
	    family = "Ludwig",
	    email = "antoinette.ludwig@canada.ca",
	    role = c("aut"),
	    comment = "Public Health Agency of Canada"
	  ),
	  person(
	    given = "Philippe",
	    family = "Berthiaume",
	    email = "philippe.berthiaume@canada.ca",
	    role = c("aut"),
	    comment = "Public Health Agency of Canada"
	  ),
		person(
		  given = "Claude",
		  family = "Nadeau",
		  email = "claude.nadeau@statcan.gc.ca",
		  role = c("aut", "cre"),
		  comment = "Statistics Canada"
		),
		person(
		  given = "Maikol",
		  family = "Diasparra",
		  email = "maikol.diasparra@statcan.gc.ca",
		  role = c("aut"),
		  comment = "Statistics Canada"
		),
		person(
		  given = "Joel",
		  family = "Barnes",
		  email = "joel.barnes@statcan.gc.ca",
		  role = c("aut"),
		  comment = "Statistics Canada"
		),
		person(
		  given = "Deirdre",
		  family = "Hennessy",
		  email = "deirdre.hennessy@statcan.gc.ca",
		  role = c("aut"),
		  comment = "Statistics Canada"
		),
		person(
		  given = "Rochelle",
		  family = "Garner",
		  email = "rochelle.garner@statcan.gc.ca",
		  role = c("aut"),
		  comment = "Statistics Canada"
		),
		person(
		  given = "Erin",
		  family = "Rees",
		  email = "erin.rees@canada.ca",
		  role = c("ctb"),
		  comment = "Public Health Agency of Canada"
		),
		person(
		  given = "Howard",
		  family = "Swerdfeger",
		  email = "howard.swerdfeger@canada.ca",
		  role = c("ctb"),
		  comment = "Public Health Agency of Canada"
		),
		person(
		  given = "Julien",
		  family = "Arino",
		  email = "julien.arino@umanitoba.ca",
		  role = c("ctb"),
		  comment = "University of Manitoba"
		),
		person(
		  given = "Saeid",
		  family = "Molladavoudi",
		  email = "saeid.molladavoudi@canada.ca",
		  role = c("ctb"),
		  comment = "Statistics Canada"
		)
	),
	Depends = "R (>= 2.10)",
	VignetteBuilder = "knitr"
))

# Create a license for the package
use_gpl3_license(name = "Antoinette Ludwig; Philippe Berthiaume; Claude Nadeau; Maikol Diasparra; Joel Barnes; Deirdre Hennessey; Rochelle Garner; Erin Rees; Howard Swerdfeger; Julien Arino; Saeid Molladavoudi")

# Add dependencies to the DESCRIPTION file
use_package("adaptivetau", "Imports")
use_package("data.table", "Imports")
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
use_package("svMisc", "Imports")
use_package("tidyr", "Imports")
use_package("triangle", "Imports")

# Add suggested packages to the DESCRIPTION file
#use_package("klippy", "Suggests")
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
load("c:/users/joelb/google drive/github/r-package-sources/no.name-demo-data.RData")
EpiSim.demo <- list(parameters = parms.tried.df, results = outcomes.summary.df)
use_data(EpiSim.demo, overwrite = TRUE)

# Run a check on the package
check()

# Build vignettes
build_vignettes()

# Build package
build(path = "c:/users/joelb/google drive/github/r-package-sources")

# Build PDF manual
# If no path displaying for qpdf, visit https://stackoverflow.com/questions/41570633/how-to-build-qpdf-on-windows
Sys.which(Sys.getenv("R_QPDF", "qpdf"))

if(! isTRUE(tinytex:::is_tinytex())) tinytex::install_tinytex()
tinytex:::install_yihui_pkgs()
tinytex:::is_tinytex()
Sys.which("pdflatex")

devtools::install_github("yihui/tinytex")

build_manual("c:/users/joelb/google drive/github/episim", path = "c:/users/joelb/google drive/github/r-package-sources")

tinytex:::tinytex_root()
