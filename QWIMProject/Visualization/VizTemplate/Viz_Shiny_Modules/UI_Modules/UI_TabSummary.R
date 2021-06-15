

Mod_Viz_UI_TabSummary <- modules::module(
{

## packages that need to be explicitly imported within this module 
#    modules::import(from = "dplyr")  ## needed for %>%


## define local piping operator, to avoid loading dplyr package
    `%>%` <- dplyr::`%>%`


## local files or functions that have to be imported explicitly
#   nameForLocalUsage <- modules::use(module = "SomeName")  


## functions exported from this module
    modules::export("DisplayContent")


DisplayContent <- function(
    savedData,
    savedFuncs,
    tabIDs)
{
  nameFunctionForMessage <- "Mod_Viz_UI_TabSummary$DisplayContent() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <-  semantic.dashboard::tabItem(
    
    tabName = tabIDs[["ID_TabSummary"]],  ## needs to be consistent with tabID defined in DisplayDashboardSidebar
    
    DisplayContent_FirstRow(
      savedData = savedData,
      savedFuncs = savedFuncs),
    
    DisplayContent_SecondRow(
      savedData = savedData,
      savedFuncs = savedFuncs),
    
    DisplayContent_ThirdRow(
      savedData = savedData,
      savedFuncs = savedFuncs)
  )
  
  return(theUI)
}


DisplayContent_FirstRow <- function(
    savedData,
    savedFuncs)
{
  nameFunctionForMessage <- "Mod_Viz_UI_TabSummary$DisplayContent_FirstRow() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <- shiny::fluidRow(
    
    semantic.dashboard::box(
      
      title = "",
      color = "orange", 
      width = 4, 
      status = "primary",
      collapsible = FALSE, 
      ribbon = FALSE, 
      title_side = "top", 
      semantic.dashboard::valueBoxOutput(outputId = "outputID_TabSummary_TotalValue"),
      
      shiny::br(),
      
      shiny::actionButton(
        inputId = "inputID_ActionButton_TabSummary_TotalValue",
        label = "More Info",
        semantic.dashboard::icon("th"),
        width = "100%",
        style = "color: #00002f; background-color: white; border-color: white"),
      
      shiny::br()
    ),
    
    semantic.dashboard::box(
      
      title = "",
      color = "orange", 
      width = 4, 
      collapsible = FALSE, 
      ribbon = FALSE, 
      title_side = "top", 
      
#      semantic.dashboard::valueBoxOutput(outputId = "outputID_TabSummary_TempOne"),
      
      shiny::br(),
      
      # shiny::actionButton(
      #   inputId = "inputID_ActionButton_TabSummary_TempOne", 
      #   label = "More Info", 
      #   semantic.dashboard::icon("th"),
      #   width = "100%",
      #   style = "color: #00002f; background-color: white; border-color: white"),
      
      shiny::br()
    ),
    
    semantic.dashboard::box(
      
      title = "",
      color = "orange", 
      width = 4, 
      collapsible = FALSE, 
      ribbon = FALSE, 
      title_side = "top", 
      
#      semantic.dashboard::valueBoxOutput(outputId = "outputID_TabSummary_TempTwo"),
      
      shiny::br(),
      
      # shiny::actionButton(
      #   inputId = "inputID_ActionButton_TabSummary_TempTwo", 
      #   label = "More Info", 
      #   semantic.dashboard::icon("th"),
      #   width = "100%",
      #   style = "color: #00002f; background-color: white; border-color: white"),
      
      shiny::br()
    )
  )
  
  return(theUI)
}


DisplayContent_SecondRow <- function(
    savedData,
    savedFuncs)
{
  nameFunctionForMessage <- "Mod_Viz_UI_TabSummary$DisplayContent_SecondRow() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <- shiny::fluidRow(
    
    semantic.dashboard::box(
      
      title = "",
      color = "blue", 
      width = 4, 
      status = "primary",
      collapsible = FALSE, 
      ribbon = FALSE, 
      title_side = "top", 
      
      semantic.dashboard::valueBoxOutput(outputId = "outputID_TabSummary_PortfolioValue"),
      
      shiny::br(),
      
      shiny::actionButton(
        inputId = "inputID_ActionButton_TabSummary_PortfolioValue", 
        label = "More Info", 
        semantic.dashboard::icon("th"),
        width = "100%",
        style = "color: #00002f; background-color: white; border-color: white"),
      
      shiny::br()
    ),
    
    semantic.dashboard::box(
      
      title = "",
      color = "blue", 
      width = 4, 
      collapsible = FALSE, 
      ribbon = FALSE, 
      title_side = "top", 
      
#      semantic.dashboard::valueBoxOutput(outputId = "outputID_TabSummary_TempThree"),
      
      shiny::br(),
      
      # shiny::actionButton(
      #   
      #   inputId = "inputID_ActionButton_TabSummary_TempThree", 
      #   label = "More Info", 
      #   semantic.dashboard::icon("th"),
      #   width = "100%",
      #   style = "color: #00002f; background-color: white; border-color: white"),
      
      shiny::br()
    ),
    
    semantic.dashboard::box(
      
      title = "",
      color = "blue", 
      width = 4, 
      collapsible = FALSE, 
      ribbon = FALSE, 
      title_side = "top", 
      
#      semantic.dashboard::valueBoxOutput(outputId = "outputID_TabSummary_TempFour"),
      
      shiny::br(),
      
      # shiny::actionButton(
      #   
      #   inputId = "inputID_ActionButton_TabSummary_TempFour", 
      #   label = "More Info", 
      #   semantic.dashboard::icon("th"),
      #   width = "100%",
      #   style = "color: #00002f; background-color: white; border-color: white"),
      
      shiny::br()
    )
  )
  
  return(theUI)
}


DisplayContent_ThirdRow <- function(
  savedData,
  savedFuncs)
{
  nameFunctionForMessage <- "Mod_Viz_UI_TabSummary$DisplayContent_ThirdRow() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <- shiny::fluidRow(
    
    semantic.dashboard::box(
      
      title = "",
      color = "grey", 
      width = 4, 
      status = "primary",
      collapsible = FALSE, 
      ribbon = FALSE, 
      title_side = "top", 
      
#      semantic.dashboard::valueBoxOutput(outputId = "outputID_TabSummary_TempFive"),
      
      shiny::br(),
      
      # shiny::actionButton(
      #   
      #   inputId = "inputID_ActionButton_TabSummary_TempFive", 
      #   label = "More Info", 
      #   semantic.dashboard::icon("th"),
      #   width = "100%",
      #   style = "color: #00002f; background-color: white; border-color: white"),
      
      shiny::br()
    ),
    
    semantic.dashboard::box(
      
      title = "",
      color = "grey", 
      width = 4, 
      collapsible = FALSE, 
      ribbon = FALSE, 
      title_side = "top", 
      
      semantic.dashboard::valueBoxOutput(outputId = "outputID_TabSummary_DateLastUpdate"),
      
      shiny::br()
    ),
    
    semantic.dashboard::box(
      
      title = "",
      color = "grey", 
      width = 4, 
      collapsible = FALSE, 
      ribbon = FALSE, 
      title_side = "top", 
      
      semantic.dashboard::valueBoxOutput(outputId = "outputID_TabSummary_DateLastReport"),
      
      shiny::br(),
      
      shiny::actionButton(
        inputId = "inputID_ActionButton_TabSummary_DateLastReport", 
        label = "More Info", 
        semantic.dashboard::icon("th"),
        width = "100%",
        style = "color: #00002f; background-color: white; border-color: white"),
      
      shiny::br()
    )
  )
  
  return(theUI)
}


})
