


Mod_Viz_Server_TabAnalysisOne <- modules::module(
{

## packages that need to be explicitly imported within this module 
#    modules::import(from = "dplyr")  ## needed for %>%


## define local piping operator, to avoid loading dplyr package
    `%>%` <- dplyr::`%>%`


## local files or functions that have to be imported explicitly
#   nameForLocalUsage <- modules::use(module = "SomeName")  


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
  nameFunctionForMessage <- "Mod_Viz_Server_TabAnalysisOne$RenderContent() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theOutputIDs <- outputIDs
  
  shiny::observeEvent(
    
    eventExpr = reactiveInputs[["InvestorName"]],
    
    handlerExpr = {
      
      theOutputIDs$outputID_TabAnalysisOne_boxplotOne <- shiny::renderPlot({
        shiny::callModule(
          module = CalcBoxPlot,
          id = "ID_Mod_Viz_Svr_TabAnalysis1_CalcBoxPlot",
          savedData = savedData[["DataCars"]],
          savedFuncs = savedFuncs)
      })
      
    }) 
  
  shiny::observeEvent(
    
    eventExpr = reactiveInputs[["NameTimeSeries_TabAnalysisOne_SecondSubTab"]],
    
    handlerExpr = {
      
      theOutputIDs$outputID_TabAnalysisOne_PlotTimeSeries <- plotly::renderPlotly({
        shiny::callModule(
          module = CalcPlotTimeSeries,
          id = "ID_Mod_Viz_Svr_TabAnalysisOne_CalcPlotTimeSeries",
          savedData = savedData,
          reactiveInputs = reactiveInputs,
          savedFuncs = savedFuncs)
      })
      
    }) 
  
  return(theOutputIDs)
}


CalcBoxPlot <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,
## the regular function arguments
    savedData,
    savedFuncs)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabAnalysisOne$CalcBoxPlot() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theData <- savedData
  theData$am <- base::factor(
    x = savedData$am,
    levels = c(0,1),
    labels = c("Automatic","Manual"))
  
  theOutput <- ggplot2::ggplot(theData) +
    ggplot2::aes(x = am, y = mpg) +
    ggplot2::geom_boxplot(fill = semantic.dashboard::semantic_palette[["green"]]) + 
    ggplot2::xlab("gearbox") + 
    ggplot2::ylab("Miles per gallon")
  
  return(theOutput)
}


CalcPlotTimeSeries <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,
## the regular function arguments
    savedData,
    savedFuncs,
    reactiveInputs)
{
  nameFunctionForMessage <- "Mod_Viz_Server_TabAnalysisOne$CalcPlotTimeSeries() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theData <- savedData[["DataTimeSeries"]]
  theNameTimeSeries <- shiny::isolate(expr = 
      reactiveInputs[["NameTimeSeries_TabAnalysisOne_SecondSubTab"]])
  
  namesTimeSeries <- base::names(theData)
  namesTimeSeries <- namesTimeSeries[-1]  ## since the first column is Date
  idx <- base::which(namesTimeSeries == theNameTimeSeries)
  
  availableColors <- savedData[["Colors_PlotTimeSeries"]]
  thePlotColor <- base::as.character(availableColors[idx,2])
  
## the static plot
  thePlot <- ggplot2::ggplot(theData) +
    ggplot2::aes_string(x = "Date", y = theNameTimeSeries) + 
    ggplot2::geom_line(color = thePlotColor) +
    ggplot2::xlab(label = "Date") + 
## to exemplify how to use functions which are stored in list savedFuncs
## we have replaced the function below by its saved counterpart in savedFuncs
#    ggplot2::ylab(label = "Value") +
    savedFuncs[["Func_ggplot_ylab"]](label = "Value") +
    ggplot2::theme_bw()
  
## the interactive plot
  theOutput <- plotly::ggplotly(p = thePlot)
  
  return(theOutput)
}


})
