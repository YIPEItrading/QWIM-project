

## the function is defined first, and executed at end of the file
RunShinyViz <- function(
    saveDataAndFunctions = TRUE,
    shinyWorkingDir = base::file.path("Visualization","VizTemplate"), 
    version = 'prod')
{
  nameFunctionForMessage <- "RunShinyViz() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  fileNames <- list(prod = 'app.R',
                   dev = 'app.R')
  pathShinyFolder <- base::file.path(shinyWorkingDir, "Viz_Shiny_Modules")
  pathFileSavedInfo <- base::file.path(shinyWorkingDir, 
                                      "Viz_Shiny_Modules","Utils", "SaveInfo.R")
  pathFileDefaultValues <- base::file.path(shinyWorkingDir,
                              "Viz_Shiny_Modules",'Utils','SetDefaultValues.R')
  
  if (saveDataAndFunctions) {
    
## source the needed files    
      base::source(
        file = pathFileSavedInfo,
        local = TRUE)
      base::source(
        file = pathFileDefaultValues,
        local = TRUE)
    
      nameFuncs <- list()
      nameFuncs[["SetValuesUserInputs"]] <- Mod_Viz_SetDefaultValues$SetValues_UserInputs
      nameFuncs[["SetValuesInnerVariables"]] <- Mod_Viz_SetDefaultValues$SetValues_InnerVariables
      
      Mod_Viz_SaveInfo$SaveDataAndFunctions(
          pathShinyFolder = pathShinyFolder,
          nameFuncs = nameFuncs)
  }
  
  theMessage <- base::paste0("The working directory for this R project is ", base::getwd())
  base::message(theMessage)
  
  fileToRun <- fileNames[[version]]
  
  base::options(browser = base::paste0(Sys.getenv('PROGRAMFILES'),
                                       '\\Google\\Chrome\\Application\\chrome.exe'))
  
  shiny::runApp(
      appDir = base::file.path(pathShinyFolder, fileToRun),
      host = '0.0.0.0', 
      port = 3089, 
      launch.browser = TRUE)
}


## and now execute
# RunShinyViz(saveDataAndFunctions = TRUE)
 RunShinyViz(saveDataAndFunctions = FALSE)
