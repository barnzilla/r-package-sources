# Load packages
package_names <- c("devtools", "NCmisc", "klippy", "roxygen2")
load_packages <- lapply(package_names, require, character.only = TRUE)

# Create package
create(path = "c:/users/joel/google drive/github/capl")

# Customize the DESCRIPTION file
use_description(fields = list(
  Language = "en",
  Title = "Compute and visualize CAPL-2 scores and interpretations",
  Version = "1.32",
  Description = "This package contains tools to compute and visualize CAPL-2 (Canadian Assessment of Physical Literacy, Second Edition; www.capl-eclp.ca) scores and interpretations from raw data.",
  `Authors@R` = c(
    person(given = "Joel", family = "Barnes", email = "j@barnzilla.ca", role = c("aut", "cre"), comment = c(ORCID = "0000-0002-7621-9020")),
    person(given = "Michelle", family = "Guerrero", email = "mguerrero@cheo.on.ca", role = c("aut"), comment = c(ORCID = "0000-0001-8169-5040"))
  ),
  Maintainer = "Joel Barnes <j@barnzilla.ca>",
  Author = "Joel Barnes <j@barnzilla.ca> [aut, cre], Michelle Guerrero <mguerrero@cheo.on.ca> [aut]",
  Depends = "R (>= 2.10)",
  VignetteBuilder = "knitr",
  URL = "https://github.com/barnzilla/capl",
  BugReports = "https://github.com/barnzilla/capl/issues"
))

# Create a license for the package
use_gpl3_license(name = "Joel Barnes; Michelle Guerrero")

# Add dependencies to the DESCRIPTION file
use_package("dplyr", "Imports")
use_package("ggplot2", "Imports")
use_package("lubridate", "Imports")
use_package("magrittr", "Imports")
use_package("readxl", "Imports")
use_package("stats", "Imports")
use_package("writexl", "Imports")

# Add suggested packages to the DESCRIPTION file
use_package("klippy", "Suggests")
use_package("knitr", "Suggests")
use_package("rmarkdown", "Suggests")

# Create documentation
document()

# Find all functions by package for a given file
package_names <- c("dplyr", "ggplot2", "ggpubr", "kableExtra", "lsr", "lubridate", "psych", "sjPlot", "stringr", "tidyverse", "readxl", "writexl")
load_packages <- lapply(package_names, require, character.only = TRUE)
functions1 <- list.functions.in.file("c:/users/joel/google drive/github/capl/r/utilities.R")
functions2 <- list.functions.in.file("c:/users/joel/google drive/github/capl/r/physical_competence.R")
functions3 <- list.functions.in.file("c:/users/joel/google drive/github/capl/r/capl.R")
functions4 <- list.functions.in.file("c:/users/joel/google drive/github/capl/r/daily_behaviour.R")
functions5 <- list.functions.in.file("c:/users/joel/google drive/github/capl/r/data_visualization.R")

# Create CAPL demo data
set.seed(93)
n <- 500
capl_demo_data <- data.frame(
  "age" = sample(c(7:13, NA), n, replace = TRUE, prob = c(0.05, rep(0.17, 5), 0.05, 0.05)),
  "gender" = sample(c("Girl", "g", "Female", "f", "Boy", "b", "Male", "m", NA), n, replace = TRUE, prob = c(rep(0.11875, 8), 0.05)),
  "pacer_lap_distance" = sample(c(15, 20, NA), n, replace = TRUE, prob = c(0.475, 0.475, 0.05)),
  "pacer_laps" = sample(c(0:200, NA), n, replace = TRUE),
  "plank_time" = sample(c(0:300, NA), n, replace = TRUE),
  "camsa_skill_score1" = sample(c(0:14, NA), n, replace = TRUE, prob = c(rep(0.02, 4), rep(0.09222222, 11), 0.05)),
  "camsa_time1" = sample(c(10:35, NA), n, replace = TRUE, prob = c(rep(0.03653846, 26), 0.05)),
  "camsa_skill_score2" = sample(c(0:14, NA), n, replace = TRUE, prob = c(rep(0.02, 4), rep(0.09222222, 11), 0.05)),
  "camsa_time2" = sample(c(10:35, NA), n, replace = TRUE, prob = c(rep(0.03653846, 26), 0.05)),
  "steps1" = sample(c(900:31000, NA), n, replace = TRUE),
  "time_on1" = sample(c("5:13am", "05:00", "06:00", "07:00", "8:00am", "6:13", "07:48am", "6:07", NA), n, replace = TRUE),
  "time_off1" = sample(c("8:17pm", "21:00", "10:57 pm", "11:13pm", "22:00", "23:00", "08:30pm", "11:57pm", NA), n, replace = TRUE),
  "non_wear_time1" = sample(c(0:90, NA), n, replace = TRUE),
  "steps2" = sample(c(900:31000, NA), n, replace = TRUE),
  "time_on2" = sample(c("5:13am", "05:00", "06:00", "07:00", "8:00am", "6:13", "07:48am", "6:07", NA), n, replace = TRUE),
  "time_off2" = sample(c("8:17pm", "21:00", "10:57 pm", "11:13pm", "22:00", "23:00", "08:30pm", "11:57pm", NA), n, replace = TRUE),
  "non_wear_time2" = sample(c(0:90, NA), n, replace = TRUE),
  "steps3" = sample(c(900:31000, NA), n, replace = TRUE),
  "time_on3" = sample(c("5:13am", "05:00", "06:00", "07:00", "8:00am", "6:13", "07:48am", "6:07", NA), n, replace = TRUE),
  "time_off3" = sample(c("8:17pm", "21:00", "10:57 pm", "11:13pm", "22:00", "23:00", "08:30pm", "11:57pm", NA), n, replace = TRUE),
  "non_wear_time3" = sample(c(0:90, NA), n, replace = TRUE),
  "steps4" = sample(c(900:31000, NA), n, replace = TRUE),
  "time_on4" = sample(c("5:13am", "05:00", "06:00", "07:00", "8:00am", "6:13", "07:48am", "6:07", NA), n, replace = TRUE),
  "time_off4" = sample(c("8:17pm", "21:00", "10:57 pm", "11:13pm", "22:00", "23:00", "08:30pm", "11:57pm", NA), n, replace = TRUE),
  "non_wear_time4" = sample(c(0:90, NA), n, replace = TRUE),
  "steps5" = sample(c(900:31000, NA), n, replace = TRUE),
  "time_on5" = sample(c("5:13am", "05:00", "06:00", "07:00", "8:00am", "6:13", "07:48am", "6:07", NA), n, replace = TRUE),
  "time_off5" = sample(c("8:17pm", "21:00", "10:57 pm", "11:13pm", "22:00", "23:00", "08:30pm", "11:57pm", NA), n, replace = TRUE),
  "non_wear_time5" = sample(c(0:90, NA), n, replace = TRUE),
  "steps6" = sample(c(900:31000, NA), n, replace = TRUE),
  "time_on6" = sample(c("5:13am", "05:00", "06:00", "07:00", "8:00am", "6:13", "07:48am", "6:07", NA), n, replace = TRUE),
  "time_off6" = sample(c("8:17pm", "21:00", "10:57 pm", "11:13pm", "22:00", "23:00", "08:30pm", "11:57pm", NA), n, replace = TRUE),
  "non_wear_time6" = sample(c(0:90, NA), n, replace = TRUE),
  "steps7" = sample(c(900:31000, NA), n, replace = TRUE),
  "time_on7" = sample(c("5:13am", "05:00", "06:00", "07:00", "8:00am", "6:13", "07:48am", "6:07", NA), n, replace = TRUE),
  "time_off7" = sample(c("8:17pm", "21:00", "10:57 pm", "11:13pm", "22:00", "23:00", "08:30pm", "11:57pm", NA), n, replace = TRUE),
  "non_wear_time7" = sample(c(0:90, NA), n, replace = TRUE),
  "self_report_pa" = sample(c(1:7, NA), n, replace = TRUE, prob = c(rep(0.1, 5), rep(0.175, 2), 0.05)),
  "csappa1" = sample(c(1:4, NA), n, replace = TRUE, prob = c(rep(4.210526, 4), 0.05)),
  "csappa2" = sample(c(1:4, NA), n, replace = TRUE, prob = c(rep(4.210526, 4), 0.05)),
  "csappa3" = sample(c(1:4, NA), n, replace = TRUE, prob = c(rep(4.210526, 4), 0.05)),
  "csappa4" = sample(c(1:4, NA), n, replace = TRUE, prob = c(rep(4.210526, 4), 0.05)),
  "csappa5" = sample(c(1:4, NA), n, replace = TRUE, prob = c(rep(4.210526, 4), 0.05)),
  "csappa6" = sample(c(1:4, NA), n, replace = TRUE, prob = c(rep(4.210526, 4), 0.05)),
  "why_active1" = sample(c(1:5, NA), n, replace = TRUE, prob = c(rep(0.19, 5), 0.05)),
  "why_active2" = sample(c(1:5, NA), n, replace = TRUE, prob = c(rep(0.19, 5), 0.05)),
  "why_active3" = sample(c(1:5, NA), n, replace = TRUE, prob = c(rep(0.19, 5), 0.05)),
  "feelings_about_pa1" = sample(c(1:5, NA), n, replace = TRUE, prob = c(rep(0.19, 5), 0.05)),
  "feelings_about_pa2" = sample(c(1:5, NA), n, replace = TRUE, prob = c(rep(0.19, 5), 0.05)),
  "feelings_about_pa3" = sample(c(1:5, NA), n, replace = TRUE, prob = c(rep(0.19, 5), 0.05)),
  "pa_guideline" = sample(c(1:4, NA), n, replace = TRUE, prob = c(rep(4.210526, 4), 0.05)),
  "crf_means" = sample(c(1:4, NA), n, replace = TRUE, prob = c(rep(4.210526, 4), 0.05)),
  "ms_means" = sample(c(1:4, NA), n, replace = TRUE, prob = c(rep(4.210526, 4), 0.05)),
  "sports_skill" = sample(c(1:4, NA), n, replace = TRUE, prob = c(rep(4.210526, 4), 0.05)),
  "pa_is" = sample(c(1:10), n, replace = TRUE, prob = c(0.35, rep(0.06, 5), 0.35, rep(0.06, 3))),
  "pa_is_also" = sample(c(1:10), n, replace = TRUE, prob = c(0.35, rep(0.06, 5), 0.35, rep(0.06, 3))),
  "improve" = sample(c(1:10), n, replace = TRUE, prob = c(rep(0.06, 2), 0.7, rep(0.06, 7))),
  "increase" = sample(c(1:10), n, replace = TRUE, prob = c(rep(0.06, 7), 0.7, rep(0.06, 2))),
  "when_cooling_down" = sample(c(1:10), n, replace = TRUE, prob = c(0.06, 0.7, rep(0.06, 8))),
  "heart_rate" = sample(c(1:10), n, replace = TRUE, prob = c(rep(0.06, 3), 0.7, rep(0.06, 6)))
)

use_data(capl_demo_data, overwrite = TRUE)

# Run a check on the package
check()

# Build vignettes
build_vignettes()

# Build package
build("c:/users/joel/google drive/github/capl", path = "c:/users/joel/google drive/github/r-package-sources")

# Build PDF manual
#tinytex::install_tinytex()
library(tinytex)
tinytex:::is_tinytex()
Sys.which("pdflatex")

build_manual("c:/users/joel/google drive/github/capl", path = "c:/users/joel/google drive/github/r-package-sources")
system("R CMD Rd2pdf c:/users/joel/google drive/github/capl_0.1.0.tar.gz")

library(kableExtra)

d <- data.frame(
  a = 1:10,
  b = 11:20,
  c = 21:30
)
kable(d, format = "html")

validate_steps(
     steps = c(5400, 11001, 999, 31000, 8796),
     wear_time = c(10.1, 12.6, 10.2, 10.9, 9.5)
   )
