


Mod_Viz_Server_TabSummary <- modules::module(
{

## packages that need to be explicitly imported within this module 
#    modules::import(from = "dplyr")  ## needed for %>%


## define local piping operator, to avoid loading dplyr package
`%>%` <- dplyr::`%>%`


## local files or functions that have to be imported explicitly
#   nameForLocalUsage <- modules::use(module = "SomeName")  
    pathFile <- base::file.path('Server_Modules','Server_TabResultsTwo.R')
    MVS_TR2 <- modules::use(module = pathFile)


## functions exported from this module
    modules::export("RenderContent")


RenderContent <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    savedData,
    savedFuncs,
    reactiveInputs,
    reactiveVars,
    reactiveTriggers,
    outputIDs)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabSummary$RenderContent() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theOutputIDs <- outputIDs
 
  theOutputIDs <- RenderContent_FirstRow(
    input, output, session,  
    savedData = savedData,
    savedFuncs = savedFuncs,
    reactiveInputs = reactiveInputs,
    reactiveVars = reactiveVars,
    outputIDs = theOutputIDs)
  
  theOutputIDs <- RenderContent_SecondRow(
    input, output, session,  
    savedData = savedData,
    savedFuncs = savedFuncs,
    reactiveInputs = reactiveInputs,
    reactiveVars = reactiveVars,
    outputIDs = theOutputIDs)
  
  theOutputIDs <- RenderContent_ThirdRow(
    input, output, session,  
    savedData = savedData,
    savedFuncs = savedFuncs,
    reactiveInputs = reactiveInputs,
    reactiveVars = reactiveVars,
    outputIDs = theOutputIDs)
  
  theOutputIDs <- PerformShinyEvents(
    input, output, session,  
    savedData = savedData,
    savedFuncs = savedFuncs,
    reactiveInputs = reactiveInputs,
    reactiveVars = reactiveVars,
    reactiveTriggers = reactiveTriggers,
    outputIDs = theOutputIDs)  
  
  return(theOutputIDs)
}


RenderContent_FirstRow <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    savedData,
    savedFuncs,
    reactiveInputs,
    reactiveVars,
    outputIDs)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabSummary$RenderContent_FirstRow() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theOutputIDs <- outputIDs
  theReactiveVars <- reactiveVars
  
  shiny::observeEvent(
    
    eventExpr = theReactiveVars[["TotalValue"]],
    
    handlerExpr = {
      
      theOutputIDs$outputID_TabSummary_TotalValue <-  shiny::callModule(
        module = RenderTotalValue,
        id = "ID_Mod_Viz_Server_TabSummary_RenderTotalValue",
        savedData = savedData,
        savedFuncs = savedFuncs,
        reactiveVars = theReactiveVars)
      
  })
  
  return(theOutputIDs)
}


RenderContent_SecondRow <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    savedData,
    savedFuncs,
    reactiveInputs,
    reactiveVars,
    outputIDs)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabSummary$RenderContent_SecondRow() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theOutputIDs <- outputIDs
  theReactiveVars <- reactiveVars
  
  shiny::observeEvent(
    
    eventExpr = theReactiveVars[["PortfolioValue"]],
    
    handlerExpr = {   
      
      theOutputIDs$outputID_TabSummary_PortfolioValue <- shiny::callModule(
        module = RenderPortfolioValue,
        id = "ID_Mod_Viz_Server_TabSummary_RenderPortfolioValue",
        savedData = savedData,
        savedFuncs = savedFuncs,
        reactiveVars = theReactiveVars)
      
    })      
  

  return(theOutputIDs)
}


RenderContent_ThirdRow <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    savedData,
    savedFuncs,
    reactiveInputs,
    reactiveVars,
    outputIDs)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabSummary$RenderContent_ThirdRow() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theOutputIDs <- outputIDs
  theReactiveVars <- reactiveVars
  
  shiny::observeEvent(
    
    eventExpr = reactiveVars[["DateLastUpdate"]],
    
    handlerExpr = {   
      
      theOutputIDs$outputID_TabSummary_DateLastUpdate <- shiny::callModule(
        module = RenderDateLastUpdate,
        id = "ID_Mod_Viz_Server_TabSummary_RenderDateLastUpdate",
        savedData = savedData,
        savedFuncs = savedFuncs,
        reactiveVars = theReactiveVars)   
      
  })   
  
  shiny::observeEvent(
    
    eventExpr = reactiveVars[["DateLastReport"]],
    
    handlerExpr = {   
      
      theOutputIDs$outputID_TabSummary_DateLastReport <- shiny::callModule(
        module = RenderDateLastReport,
        id = "ID_Mod_Viz_Server_TabSummary_RenderDateLastReport",
        savedData = savedData,
        savedFuncs = savedFuncs,
        reactiveVars = theReactiveVars)   
      
  })     
  
  return(theOutputIDs)
}


RenderPortfolioValue <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,
## the regular function arguments
    savedData,
    savedFuncs,
    reactiveVars)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabSummary$RenderPortfolioValue() "
  reportr::setOutputLevel(reportr::OL$Error)
  
  theValue <- shiny::isolate(expr = reactiveVars[["PortfolioValue"]])
  formattedValue <- base::prettyNum(
    x = theValue,
    big.mark = ",", 
    preserve.width = "none")
  
  theOutput <- semantic.dashboard::renderValueBox(
    
    expr = semantic.dashboard::valueBox(
      value = formattedValue,
      subtitle = "Portfolio Value",
      icon = semantic.dashboard::icon("dollar"),
      color = "",
      width = 2,
      size = "tiny")
  )
  
  return(theOutput)
}


RenderTotalValue <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,
## the regular function arguments
    savedData,
    savedFuncs,
    reactiveVars)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabSummary$RenderTotalValue() "
  reportr::setOutputLevel(reportr::OL$Error)
  
  theValue <- shiny::isolate(expr = reactiveVars[["TotalValue"]])
  formattedValue <- base::prettyNum(
    x = theValue,
    big.mark = ",", 
    preserve.width = "none")
  
  theOutput <- semantic.dashboard::renderValueBox(
    
    expr = semantic.dashboard::valueBox(
      value = formattedValue,
      subtitle = "Total Value",
      icon = semantic.dashboard::icon("dollar"),
      color = "",
      width = 2,
      size = "tiny")
  )
  
  return(theOutput)
}


RenderDateLastUpdate <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,
## the regular function arguments
    savedData,
    savedFuncs,
    reactiveVars)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabSummary$RenderDateLastUpdate() "
  reportr::setOutputLevel(reportr::OL$Error)
  
  theValue <- shiny::isolate(expr = reactiveVars[["DateLastUpdate"]])
  #  formattedValue <- lubridate::stamp(x = theValue)
  
  theOutput <- semantic.dashboard::renderValueBox(
    
    expr = semantic.dashboard::valueBox(
      value = "Feb 02, 2020", # formattedValue,
      subtitle = "Date Last Update",
      icon = semantic.dashboard::icon("calendar alternate outline"),
      color = "",
      width = 2,
      size = "tiny")
    
  )
  
  return(theOutput)
}


RenderDateLastReport <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,
## the regular function arguments
    savedData,
    savedFuncs,
    reactiveVars)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabSummary$RenderDateLastReport() "
  reportr::setOutputLevel(reportr::OL$Error)
  
  theValue <- shiny::isolate(expr = reactiveVars[["DateLastReport"]])
  #  formattedValue <- lubridate::stamp(x = theValue)
  
  theOutput <- semantic.dashboard::renderValueBox(
    
    expr = semantic.dashboard::valueBox(
      value = "Feb 10, 2020", # formattedValue,
      subtitle = "Date Last Report",
      icon = semantic.dashboard::icon("calendar alternate outline"),
      color = "",
      width = 2,
      size = "tiny")
    
  )
  
  return(theOutput)
}


PerformShinyEvents <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    savedData,
    savedFuncs,
    reactiveInputs,
    reactiveVars,
    reactiveTriggers,
    outputIDs)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabSummary$PerformShinyEvents() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theOutputIDs <- outputIDs
  
  shiny::observeEvent(
    
    eventExpr = reactiveTriggers[["ActionButton_TabSummary_TotalValue"]],
    
    handlerExpr = {
      
      theOutputIDs$outputID_TabResultsTwo_FirstSubTab_TableDT <- DT::renderDataTable({
        
        theData <- savedData[["DataCars"]]
        base::colnames(theData)[3] <- "FirstChange"
        
        shiny::callModule(
          module =  MVS_TR2$Mod_Viz_Server_TabResultsTwo$DisplaySampleDT,
          id = "ID_Mod_Viz_Svr_TabReport2_SampleDT_ActionButton_TabSummary_TotalValue",
          savedData = theData,
          savedFuncs = savedFuncs)
    })
      
  })    
  
  shiny::observeEvent(
    
    eventExpr = reactiveTriggers[["ActionButton_TabSummary_DateLastReport"]],
    
    handlerExpr = {
      
      theOutputIDs$outputID_TabResultsTwo_FirstSubTab_TableDT <- DT::renderDataTable({
        
        theData <- savedData[["DataCars"]]
        base::colnames(theData)[3] <- "SecondChange"
        
        shiny::callModule(
          module = MVS_TR2$Mod_Viz_Server_TabResultsTwo$DisplaySampleDT,
          id = "ID_Mod_Viz_Svr_TabReport2_SampleDT_ActionButton_TabSummary_DateLastReport",
          savedData = theData,
          savedFuncs = savedFuncs)
    })
      
  })    
  
  return(theOutputIDs)  
}


})
