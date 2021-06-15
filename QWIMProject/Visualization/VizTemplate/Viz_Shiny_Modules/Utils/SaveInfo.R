

## the working directory is WorkingDir_RProject


Mod_Viz_SaveInfo <- modules::module(
{

## packages that need to be explicitly imported within this module 
#    modules::import(from = "dplyr")  ## needed for %>%


## define local piping operator, to avoid loading dplyr package
    `%>%` <- dplyr::`%>%`


## local files or functions that have to be imported explicitly
#   nameForLocalUsage <- modules::use(module = "SomeName")  
##    pathFile <- base::file.path("Visualization","SemanticDashboardTemplate",
##                                "Viz_Shiny_Modules", 'Utils','SetDefaultValues.R')
##    Mod_DV <- modules::use(module = pathFile) 


## functions exported from this module
    modules::export("SaveDataAndFunctions")


SaveDataAndFunctions <- function(
    pathShinyFolder,
    nameFuncs)
{
  nameFunctionForMessage <- "Mod_Viz_SaveInfo$SaveDataAndFunctions() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  pathFolder_Inputs <- base::file.path(pathShinyFolder, "Inputs")
  if (!(base::dir.exists(pathFolder_Inputs))) {
    base::dir.create(pathFolder_Inputs)
  }
  
  nameFileSavedData <- "SavedDataForShiny.qs"
  file_SavedData = base::file.path(pathShinyFolder,"Inputs", nameFileSavedData)
  nameFileSavedFuncs <- "SavedFunctionsForShiny.qs"
  file_SavedFunctions = base::file.path(pathShinyFolder,"Inputs",nameFileSavedFuncs)
  
  SaveData(
      pathFile = file_SavedData,
      nameFuncs = nameFuncs)
  
  SaveFunctions(pathFile = file_SavedFunctions)
  ## this function has no return  
}


SaveData <- function(
    pathFile,
    nameFuncs)
{
  nameFunctionForMessage <- "Mod_Viz_SaveDataFuncs$SaveData() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  objDataToSave <- list()
  
## get data fromm various data files (sources)
  
  pathFile <- base::file.path("Data","Temp","CarData.qs")
  theCarData <- qs::qread(file = pathFile)
  objDataToSave[["DataCars"]] <- theCarData
  
  pathFile <- base::file.path("Data","Temp","TimeSeriesData.qs")
  theTimeSeriesData <- qs::qread(file = pathFile)
  objDataToSave[["DataTimeSeries"]] <- theTimeSeriesData
  theNamesTimeSeries <- names(theTimeSeriesData)
  theNamesTimeSeries <- theNamesTimeSeries[-1]
  objDataToSave[["NamesTimeSeries"]] <- theNamesTimeSeries
  
## Set colors for Plots  
  colors_PlotTimeSeries <- SetColors_PlotsTimeSeries(namesTimeSeries = theNamesTimeSeries)
  objDataToSave[["Colors_PlotTimeSeries"]] <- colors_PlotTimeSeries  
  
## Set default values to inputs and inner variables of Shiny visualizer
  dataForDefaultInputs <- NULL

  defaultUserInputs <- nameFuncs[["SetValuesUserInputs"]](
    savedData = dataForDefaultInputs)
  objDataToSave[["DefaultInputs"]] <- defaultUserInputs
  
  dataForDefaultInnerVariables <- NULL
  defaultInnerVariables <- nameFuncs[["SetValuesInnerVariables"]](
    savedData = dataForDefaultInnerVariables)
  objDataToSave[["DefaultInnerVariables"]] <- defaultInnerVariables
  
  qs::qsave(
    x = objDataToSave,
    file = pathFile)
  
  ## this function has no return   
}


SaveFunctions <- function(pathFile)
{
  
  nameFunctionForMessage <- "Mod_Viz_SaveDataFuncs$SaveFunctions() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  objFuncsToSave <- list()
  
  objFuncsToSave[["TempFunc"]] <- NULL
  objFuncsToSave[["Func_ggplot_ylab"]] <- ggplot2::ylab
  
  qs::qsave(
    x = objFuncsToSave,
    file = pathFile)
  
  ## this function has no return   
}


SetColors_PlotsTimeSeries <- function(namesTimeSeries)
{
  
  nameFunctionForMessage <- "Mod_Viz_SaveDataFuncs$SetColors_PlotsTimeSeries() "    
  reportr::setOutputLevel(reportr::OL$Error)  
  
  numTimeSeries <- base::length(namesTimeSeries)
  ##  theColors <- grDevices::rainbow(n = numTimeSeries)
  theColors <- c("red","blue","green","gray",
                 "magenta","slateblue","chocolate","blueviolet",
                 "seagreen","indianred","turquoise","navy",
                 "cyan","pink","purple","yellow")
  theColorsAsHex <- gplots::col2hex(theColors)
  
  colorsPlot <- tibble::tibble(
    NameTimeSeries = namesTimeSeries,
    Color = theColors)
  
  return(colorsPlot)
}


})
