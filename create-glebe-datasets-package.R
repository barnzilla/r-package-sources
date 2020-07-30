# Load packages
package_names <- c("devtools", "NCmisc", "klippy", "roxygen2")
load_packages <- lapply(package_names, require, character.only = TRUE)

# Create package
create(path = "c:/users/joel/google drive/github/glebe.datasets")

# Customize the DESCRIPTION file
use_description(fields = list(
  Language = "en",
  Title = "Create demo datasets for instructional use",
  Version = "0.5",
  Description = "This package contains tools to create demo datasets for instructional use (e.g., in undergraduate statistics classes).",
  `Authors@R` = c(
    person(given = "Joel", family = "Barnes", email = "j@barnzilla.ca", role = c("aut", "cre"), comment = c(ORCID = "0000-0002-7621-9020")),
    person(given = "Michelle", family = "Guerrero", email = "mguerrero@cheo.on.ca", role = c("aut"), comment = c(ORCID = "0000-0001-8169-5040"))
  ),
  Maintainer = "Joel Barnes <j@barnzilla.ca>",
  Author = "Joel Barnes <j@barnzilla.ca> [aut, cre], Michelle Guerrero <mguerrero@cheo.on.ca> [aut]",
  Depends = "R (>= 2.10)",
  VignetteBuilder = "knitr",
  URL = "https://github.com/barnzilla/glebe",
  BugReports = "https://github.com/barnzilla/glebe/issues"
))

# Create a license for the package
use_gpl3_license(name = "Joel Barnes; Michelle Guerrero")

# Add dependencies to the DESCRIPTION file
use_package("haven", "Imports")
use_package("scales", "Imports")
use_package("simstudy", "Imports")
use_package("writexl", "Imports")

# Add suggested packages to the DESCRIPTION file
use_package("klippy", "Suggests")
use_package("knitr", "Suggests")
use_package("rmarkdown", "Suggests")

# Create documentation
document()

# Find all functions by package for a given file
package_names <- c("haven", "scales", "simstudy", "writexl")
load_packages <- lapply(package_names, require, character.only = TRUE)
functions1 <- list.functions.in.file("c:/users/joel/google drive/github/glebe.datasets/r/utilities.R")
functions2 <- list.functions.in.file("c:/users/joel/google drive/github/glebe.datasets/r/create_dataset.R")

# Create CAPL demo data
use_data(capl_demo_data, overwrite = TRUE)

# Run a check on the package
check()

# Build vignettes
build_vignettes()

# Build package
build("c:/users/joel/google drive/github/glebe.datasets", path = "c:/users/joel/google drive/github/r-package-sources")

# Build PDF manual
#tinytex::install_tinytex()
library(tinytex)
tinytex:::is_tinytex()
Sys.which("pdflatex")

build_manual("c:/users/joel/google drive/github/glebe.datasets", path = "c:/users/joel/google drive/github/r-package-sources")
