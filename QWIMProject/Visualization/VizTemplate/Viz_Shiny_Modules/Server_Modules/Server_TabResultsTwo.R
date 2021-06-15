


Mod_Viz_Server_TabResultsTwo <- modules::module(
{

## packages that need to be explicitly imported within this module 
#    modules::import(from = "dplyr")  ## needed for %>%


## define local piping operator, to avoid loading dplyr package
    `%>%` <- dplyr::`%>%`


## local files or functions that have to be imported explicitly
#   nameForLocalUsage <- modules::use(module = "SomeName")  


## functions exported from this module
    modules::export("RenderContent")
    modules::export("DisplaySampleDT")


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
  nameFunctionForMessage <- "Mod_Viz_Server_TabResultsTwo$RenderContent() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  objReactive_UserInputs <- reactiveInputs
  
  theOutputIDs <- outputIDs
  
  shiny::observeEvent(
    
    eventExpr = reactiveInputs[["InvestorName"]],
    
    handlerExpr = {
      
      theOutputIDs$outputID_TabResultsTwo_FirstSubTab_TableDT <- DT::renderDataTable({
        
        theData <- savedData[["DataCars"]]
        base::colnames(theData)[3] <- "Original"
        
        shiny::callModule(
          module = DisplaySampleDT,
          id = "ID_Mod_Viz_Svr_TabReport2_DisplaySampleDT",
          savedData = theData,
          savedFuncs = savedFuncs)
    })
      
  })   
  
  return(theOutputIDs)
}


DisplaySampleDT <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    savedData,
    savedFuncs)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabReportTwo$DisplaySampleDT() "    
  reportr::setOutputLevel(reportr::OL$Error)

  outputTable <- DT::datatable(data = savedData)
  numColsTable <- base::ncol(savedData)
  
  # outputTable <- DT::formatRound(
  #   table = outputTable,
  #   columns = c(2:numColsTable),
  #   digits = 2)
  
  theOutput <- DT::formatStyle(
    table = outputTable,
    columns = c(2:numColsTable),
    'text-align' = 'center')
  
  return(theOutput)
} 


})
