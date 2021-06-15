
base::cat("Display the current library path \n \n")
thePaths <- base::normalizePath(path = .libPaths(), 
                                winslash = "/")
base::print(thePaths)
base::cat("\n")

snapshotDateForPackages <- "2021-06-15"

options(install.packages.compile.from.source = "both") # "always")

pathFile <- base::file.path("CheckpointUtils.R")
base::source(file = pathFile,
             local = TRUE)


isPackage_Installed <- "checkpoint" %in% rownames(installed.packages())
if (!isPackage_Installed){
  utils::install.packages("checkpoint")
}

SetupSnapshot(
  snapshotDate = snapshotDateForPackages,
  useLocalRepo = FALSE)  ## if TRUE, install from local repo


packagesNotScannedByCheckpoint <- c(
    "shinythemes","highcharter","DT","fastmatch","feather","kableExtra","plotrix","factoextra","tidyverse",
    "rio","highr","shinyjs","shiny.semantic","semantic.dashboard","svglite","gplots","randomcoloR","dendextend",
    "shinydashboard","RQuantLib","narray","processx","rhandsontable", "knitr","rmarkdown","plotly","rsconnect",
    "shiny.router")

InstallPackages_Overlay(
  packagesToCheck = packagesNotScannedByCheckpoint,
  snapshotDate = snapshotDateForPackages)

# remotes::install_github("Appsilon/shiny.react")
# remotes::install_github("Appsilon/shiny.fluent")

#remotes::install_github("Appsilon/shiny.semantic@develop")
#remotes::install_github("Appsilon/semantic.dashboard@develop")

## InstallPackagesLocal()

InspectResultsCheckpoint()

## just to ensure that tidyverse (and dependencies) is installed
checkTidyverseDependencies <- TRUE
if (checkTidyverseDependencies) {
  tidyverse::tidyverse_deps()
  tidyverse::tidyverse_packages()
}

base::cat("Display the current library path \n \n")
thePaths <- base::normalizePath(path = .libPaths(), 
                                winslash = "/")
base::print(thePaths)

