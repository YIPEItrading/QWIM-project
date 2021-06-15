

## as soon as we run the code for the Shiny app, the working directory becomes 
## WorkingDir_RProject/.../Viz_Shiny_Modules
## instead of 
## WorkingDir_RProject
## this is reflected in the relative path of the files sourced below
pathFile <- base::file.path("Utils","GetSavedInfo.R")
base::source(file = pathFile,
             local = TRUE)


## define local piping operator
`%>%` <- dplyr::`%>%`


theUI <- function(request) 
{
  
  tabIDs_SidebarMenu <- Mod_Viz_UI_Main$SetTabIDs_SidebarMenu()
  
  contentUI <- semantic.dashboard::dashboardPage(
    
    title = "Viz Template",
    
    header = Mod_Viz_UI_Main$DisplayDashboardHeader(
      savedData = objSavedData,
      savedFuncs = objSavedFuncs),
    
    sidebar = Mod_Viz_UI_Main$DisplayDashboardSidebar(
      savedData = objSavedData,
      savedFuncs = objSavedFuncs,
      tabIDs = tabIDs_SidebarMenu),
    
    body = Mod_Viz_UI_Main$DisplayDashboardBody(
      savedData = objSavedData,
      savedFuncs = objSavedFuncs,
      tabIDs = tabIDs_SidebarMenu)

  )
  
  return(contentUI)
} ## corresponds to theUI <- function(request) 


theServer <- function(input, output, session) 
{
  
  theMessage <- base::paste0("The working directory for this Shiny visualizer is ", base::getwd())
  base::message(theMessage)  
  
## create structures contained reactive values 
  reactiveUserInputs <- shiny::callModule(
    module = Mod_Viz_Svr_ReactiveVars$SetInitialValues_ReactiveUserInputs,
    id = "ID_Mod_Viz_Svr_ReactiveVars_SetInitialValues_ReactiveUserInputs",
    savedData = objSavedData)
  
  reactiveInnerVariables <- shiny::callModule(
    module = Mod_Viz_Svr_ReactiveVars$SetInitialValues_ReactiveInnerVariables,
    id = "ID_Mod_Viz_Svr_ReactiveVars_SetInitialValues_ReactiveInnerVariables",
    savedData = objSavedData)
  
  reactiveTriggers <- shiny::callModule(
    module = Mod_Viz_Svr_ReactiveVars$SetInitialValues_ReactiveTriggers,
    id = "ID_Mod_Viz_Svr_ReactiveVars_SetInitialValues_ReactiveTriggers",
    savedData = objSavedData)
  
## observe events to update reactive values 
  reactiveUserInputs <- shiny::callModule(
    module = Mod_Viz_Svr_ReactiveVars$ObserveEvents_ReactiveUserInputs,
    id = "ID_Mod_Viz_Svr_ReactiveVars_ObserveEvents_ReactiveUserInputs",
    regularInputs = input,
    reactiveInputs = reactiveUserInputs)
  
  reactiveInnerVariables <- shiny::callModule(
    module = Mod_Viz_Svr_ReactiveVars$ObserveEvents_ReactiveInnerVariables,
    id = "ID_Mod_Viz_Svr_ReactiveVars_ObserveEvents_ReactiveInnerVariables",
    regularInputs = input,
    reactiveVars = reactiveInnerVariables)
  
  reactiveTriggers <- shiny::callModule(
    module = Mod_Viz_Svr_ReactiveVars$ObserveEvents_ReactiveTriggers,
    id = "ID_Mod_Viz_Svr_ReactiveVars_ObserveEvents_ReactiveTriggers",
    regularInputs = input,
    reactiveTriggers = reactiveTriggers)
  
## render content for every tab
  output <- shiny::callModule(
    module = Mod_Viz_Svr_ReactiveVars$RenderContent,
    id = "ID_Mod_Viz_Svr_ReactiveVars_RenderContent",
    savedData = objSavedData,
    outputIDs = output)
  
  output <- shiny::callModule(
    module = Mod_Viz_Server_TabData$RenderContent,
    id = "ID_Mod_Viz_Svr_TabData_RenderContent",
    savedData = objSavedData,
    savedFuncs = objSavedFuncs,
    reactiveInputs = reactiveUserInputs,
    reactiveVars = reactiveInnerVariables,
    reactiveTriggers = reactiveTriggers,
    outputIDs = output)

  output <- shiny::callModule(
    module = Mod_Viz_Server_TabAnalysisOne$RenderContent,
    id = "ID_Mod_Viz_Svr_TabAnalysis1_RenderContent",
    savedData = objSavedData,
    savedFuncs = objSavedFuncs,
    reactiveInputs = reactiveUserInputs,
    reactiveVars = reactiveInnerVariables,
    reactiveTriggers = reactiveTriggers,
    outputIDs = output)

  output <- shiny::callModule(
    module = Mod_Viz_Server_TabAnalysisTwo$RenderContent,
    id = "ID_Mod_Viz_Svr_TabAnalysis2_RenderContent",
    savedData = objSavedData,
    savedFuncs = objSavedFuncs,
    reactiveInputs = reactiveUserInputs,
    reactiveVars = reactiveInnerVariables,
    reactiveTriggers = reactiveTriggers,
    outputIDs = output)

  output <- shiny::callModule(
    module = Mod_Viz_Server_TabAnalysisThree$RenderContent,
    id = "ID_Mod_Viz_Svr_TabAnalysis3_RenderContent",
    savedData = objSavedData,
    savedFuncs = objSavedFuncs,
    reactiveInputs = reactiveUserInputs,
    reactiveVars = reactiveInnerVariables,
    reactiveTriggers = reactiveTriggers,
    outputIDs = output)

  output <- shiny::callModule(
    module = Mod_Viz_Server_TabResultsOne$RenderContent,
    id = "ID_Mod_Viz_Svr_TabResults1_RenderContent",
    savedData = objSavedData,
    savedFuncs = objSavedFuncs,
    reactiveInputs = reactiveUserInputs,
    reactiveVars = reactiveInnerVariables,
    reactiveTriggers = reactiveTriggers,
    outputIDs = output)

  output <- shiny::callModule(
    module = Mod_Viz_Server_TabResultsTwo$RenderContent,
    id = "ID_Mod_Viz_Svr_TabResults2_RenderContent",
    savedData = objSavedData,
    savedFuncs = objSavedFuncs,
    reactiveInputs = reactiveUserInputs,
    reactiveVars = reactiveInnerVariables,
    reactiveTriggers = reactiveTriggers,
    outputIDs = output)

  output <- shiny::callModule(
    module = Mod_Viz_Server_TabSummary$RenderContent,
    id = "ID_Mod_Viz_Svr_TabSummary_RenderContent",
    savedData = objSavedData,
    savedFuncs = objSavedFuncs,
    reactiveInputs = reactiveUserInputs,
    reactiveVars = reactiveInnerVariables,
    reactiveTriggers = reactiveTriggers,
    outputIDs = output)
  
}  ## corresponds to theServer <- function(input, output, session) 



## define the options for Shiny
optionsShiny <- list(
#   browser = base::paste0(Sys.getenv('PROGRAMFILES(x86)'),
#                                '\\Google\\Chrome\\Application\\chrome.exe'))
#  browser = base::paste0(Sys.getenv('PROGRAMFILES'),
#                         '\\Google\\Chrome\\Application\\chrome.exe'),
#  port = 2001,
#  host = '0.0.0.0',
  launch.browser = TRUE)


## and finally run the Shiny app
shiny::shinyApp(
  ui = theUI,
  server = theServer,
  options = optionsShiny)

