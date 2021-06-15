


Mod_Viz_UI_TabAnalysisOne <- modules::module(
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
  nameFunctionForMessage <- "Mod_Viz_UI_TabAnalysisOne$DisplayContent() "    
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
      list(menu = "First SubTab AnalysisOne", 
           content = DisplayContent_FirstSubTab(
             savedData = savedData,
             savedFuncs = savedFuncs)),
      
      list(menu = "Second SubTab AnalysisOne", 
           content = DisplayContent_SecondSubTab(
             savedData = savedData,
             savedFuncs = savedFuncs)),
      
      list(menu = "Third SubTab AnalysisOne", 
           content = DisplayContent_ThirdSubTab(
             savedData = savedData,
             savedFuncs = savedFuncs)),
      
      list(menu = "Fourth SubTab AnalysisOne", 
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
  nameFunctionForMessage <- "Mod_Viz_UI_TabAnalysisOne$DisplayContent_FirstSubTab() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <- shiny::tabPanel(
    
    FirstSubTab_SelectInput_TypeCar(
      savedData = savedData,
      savedFuncs = savedFuncs),
    
    shiny::br(),
    
    semantic.dashboard::box(
      
      width = 8,
      title = "Graphics1 Tab1 AnalysisOne",
      color = "green", 
      ribbon = TRUE, 
      title_side = "top right",
      
      shiny::plotOutput(outputId = "outputID_TabAnalysisOne_boxplotOne")),
    
    semantic.dashboard::box(
      
      width = 8,
      title = "Graphics2 Tab1 AnalysisOne",
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
  nameFunctionForMessage <- "Mod_Viz_UI_TabAnalysisOne$DisplayContent_SecondSubTab() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <- shiny::div(
    
    shiny::div(
      
      class = 'ui large steps', 
      style = 'width: calc(100%); margin: 0px;',
      
      shiny::a(
        class = 'step', 
        id = "ID_TabAnalysisOne_SecondSubTab",
        
        shiny.semantic::icon('pie chart'),
        
        shiny::div(
          class = 'content',
          
          shiny::div(
            class = 'title', 
            'Inputs for second subtab AnalysisOne'),
          
          shiny::div(
            class = 'description',
            'Description of the inputs for second subtab AnalysisOne'))),
      
      SecondSubTab_SelectInput_TimeSeries(
        savedData = savedData,
        savedFuncs = savedFuncs),
      
      shiny::br()),
    
    shiny::div(
      semantic.dashboard::box(
        
        width = 8,
        title = "Graphics Time Series",
        color = "green", 
        ribbon = TRUE, 
        title_side = "top right",
        
        plotly::plotlyOutput(outputId = "outputID_TabAnalysisOne_PlotTimeSeries"))
    )
  )
  
  return(theUI)
}


DisplayContent_ThirdSubTab <- function(
    savedData,
    savedFuncs)
{
  nameFunctionForMessage <- "Mod_Viz_UI_TabAnalysisOne$DisplayContent_ThirdSubTab() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <- shiny::div(
    
    class = 'ui large steps', 
    style = 'width: calc(100%); margin: 0px;',
    
    shiny::a(
      class = 'step', 
      id = "ID_TabAnalysisOne_ThirdSubTab",
      
      shiny.semantic::icon('bar chart'),
      
      shiny::div(
        class = 'content',
        
        shiny::div(
          class = 'title', 
          'Inputs for third subtab AnalysisOne'),
        
        shiny::div(
          class = 'description',
          'Description of the inputs for third subtab AnalysisOne')))
  )
  
  return(theUI)
}


DisplayContent_FourthSubTab <- function(
    savedData,
    savedFuncs)
{
  nameFunctionForMessage <- "Mod_Viz_UI_TabAnalysisOne$DisplayContent_FourthSubTab() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <- shiny::div(
    
    class = 'ui large steps', 
    style = 'width: calc(100%); margin: 0px;',
    
    shiny::a(
      class = 'step', 
      id = "ID_TabAnalysisOne_FourthSubTab",
      
      shiny.semantic::icon('edit'),
      
      shiny::div(
        class = 'content',
        
        shiny::div(
          class = 'title', 
          'Inputs for fourth subtab AnalysisOne'),
        
        shiny::div(
          class = 'description',
          'Description of the inputs for fourth subtab')))
  )
  
  return(theUI)
}


FirstSubTab_SelectInput_TypeCar <- function(
    savedData,
    savedFuncs)
{
  nameFunctionForMessage <- "Mod_Viz_UI_TabAnalysisOne$FirstSubTab_SelectInput_TypeCar() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <- shiny::selectInput(
    inputId = 'inputID_TabAnalysisOne_FirstSubTab_SelectTypeCar', 
    label = 'Select type of car',
    multiple = TRUE,
    choices = c("Ford", "Toyota", "Maserati", "BMW"),
    selected = c('Ford', 'Maserati'))  
  
  return(theUI)
}


SecondSubTab_SelectInput_TimeSeries <- function(
    savedData,
    savedFuncs)
{
  nameFunctionForMessage <- "Mod_Viz_UI_TabAnalysisOne$SecondSubTab_SelectInput_TimeSeries() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <- shiny::selectInput(
    inputId = 'inputID_TabAnalysisOne_SecondSubTab_SelectTimeSeries', 
    label = 'Select time series',
    multiple = FALSE,
    choices = savedData[["NamesTimeSeries"]],
    selected = c("Series_2"))  
  
  return(theUI)
}


})
