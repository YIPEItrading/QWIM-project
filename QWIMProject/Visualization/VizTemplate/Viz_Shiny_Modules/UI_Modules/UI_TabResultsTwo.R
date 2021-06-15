


Mod_Viz_UI_TabResultsTwo <- modules::module(
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
    savedFuncs)
{
  nameFunctionForMessage <- "Mod_Viz_UI_TabResultsTwo$DisplayContent() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <- semantic.dashboard::tabBox(
    title = " ", 
    color = "blue", 
    width = 16,
    collapsible = FALSE, 
    ribbon = FALSE,
    title_side = "top",
    shiny::h4(""),
    
    tabs = list(
      list(menu = "First SubTab ResultsTwo", 
           content = DisplayContent_FirstSubTab(
             savedData = savedData,
             savedFuncs = savedFuncs)),
      
      list(menu = "Second SubTab ResultsTwo", 
           content = DisplayContent_SecondSubTab(
             savedData = savedData,
             savedFuncs = savedFuncs)),
      
      list(menu = "Third SubTab ResultsTwo", 
           content = DisplayContent_ThirdSubTab(
             savedData = savedData,
             savedFuncs = savedFuncs)),
      
      list(menu = "Fourth SubTab ResultsTwo", 
           content = DisplayContent_FourthSubTab(
             savedData = savedData,
             savedFuncs = savedFuncs))
    )
  )
  
  return(theUI)
}


DisplayContent_FirstSubTab <- function(
    savedData,
    savedFuncs)
{
  nameFunctionForMessage <- "Mod_Viz_UI_TabResultsTwo$DisplayContent_FirstSubTab() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <- shiny::tabPanel(
    
    shiny::br(),
    
    semantic.dashboard::box(
      
      width = 8,
      title = "Graphics1 Tab1 ResultsTwo",
      color = "green", 
      ribbon = TRUE, 
      title_side = "top right",
      
      DT::dataTableOutput(outputId = "outputID_TabResultsTwo_FirstSubTab_TableDT")
    ),
    
    semantic.dashboard::box(
      
      width = 8,
      title = "Graphics2 Tab1 ResultsTwo",
      color = "blue", 
      ribbon = TRUE, 
      title_side = "top right")
  )
  
  return(theUI)
}


DisplayContent_SecondSubTab <- function(
    savedData,
    savedFuncs)
{
  nameFunctionForMessage <- "Mod_Viz_UI_TabResultsTwo$DisplayContent_SecondSubTab() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <- shiny::div(
    
    shiny::div(
      
      class = 'ui large steps', 
      style = 'width: calc(100%); margin: 0px;',
      
      shiny::a(
        class = 'step', 
        id = "ID_TabResultsTwo_SecondSubTab",
        
        shiny.semantic::icon('pie chart'),
        
        shiny::div(
          class = 'content',
          
          shiny::div(
            class = 'title', 
            'Inputs for second subtab ResultsTwo'),
          
          shiny::div(
            class = 'description',
            'Description of the inputs for second subtab ResultsTwo '))),
      
      shiny::br()),
    
    shiny::div(
      semantic.dashboard::box(
        
        width = 8,
        title = "Graphics Time Series Results Two",
        color = "green", 
        ribbon = TRUE, 
        title_side = "top right"
        
#        plotly::plotlyOutput(outputId = "outputID_TabResultsTwo_PlotTimeSeries")
      )
    )
  )
  
  return(theUI)
}


DisplayContent_ThirdSubTab <- function(
    savedData,
    savedFuncs)
{
  nameFunctionForMessage <- "Mod_Viz_UI_TabResultsTwo$DisplayContent_ThirdSubTab() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <- shiny::div(
    
    class = 'ui large steps', 
    style = 'width: calc(100%); margin: 0px;',
    
    shiny::a(
      class = 'step', 
      id = "ID_TabResultsTwo_ThirdSubTab",
      
      shiny.semantic::icon('bar chart'),
      
      shiny::div(
        class = 'content',
        
        shiny::div(
          class = 'title', 
          'Inputs for third subtab ResultsTwo'),
        
        shiny::div(
          class = 'description',
          'Description of the inputs for third subtab ResultsTwo')))
  )
  
  return(theUI)
}


DisplayContent_FourthSubTab <- function(
    savedData,
    savedFuncs)
{
  nameFunctionForMessage <- "Mod_Viz_UI_TabResultsTwo$DisplayContent_FourthSubTab() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <- shiny::div(
    
    class = 'ui large steps', 
    style = 'width: calc(100%); margin: 0px;',
    
    shiny::a(
      class = 'step', 
      id = "ID_TabResultsTwo_FourthSubTab",
      
      shiny.semantic::icon('edit'),
      
      shiny::div(
        class = 'content',
        
        shiny::div(
          class = 'title', 
          'Inputs for fourth subtab ResultsTwo'),
        
        shiny::div(
          class = 'description',
          'Description of the inputs for fourth subtab ResultsTwo')))
  )
  
  return(theUI)
}


})
