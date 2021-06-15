

Mod_Viz_Svr_ReactiveVars <- modules::module(
{
  
## packages that need to be explicitly imported within this module 
#    modules::import(from = "dplyr")  ## needed for %>%


## define local piping operator, such that we do not need to import explicitly dplyr package
    `%>%` <- dplyr::`%>%`  

## local files or functions that have to be imported explicitly
#   nameForLocalUsage <- modules::use(module = "SomeName")  
    # pathFile <- base::file.path('UI_Modules','UI_TabData.R')
    # Mod_UI_TDa <- modules::use(module = pathFile)


## functions exported from this module
    modules::export("SetInitialValues_ReactiveUserInputs")
    modules::export("SetInitialValues_ReactiveInnerVariables")
    modules::export("SetInitialValues_ReactiveTriggers")
    modules::export("ObserveEvents_ReactiveUserInputs")
    modules::export("ObserveEvents_ReactiveInnerVariables")
    modules::export("ObserveEvents_ReactiveTriggers")
    modules::export("RenderContent")


SetInitialValues_ReactiveUserInputs <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    savedData)
{
  nameFunctionForMessage <- "Mod_Viz_Svr_ReactiveVars$SetInitialValues_ReactiveUserInputs() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theReactiveUserInputs <- shiny::reactiveValues(
## Investor Info
    InvestorName = savedData[["DefaultInputs"]][["Investor"]][["Name"]],
    InvestorDateOfBirth = savedData[["DefaultInputs"]][["Investor"]][["DateOfBirth"]],
    InvestorLifeExpectancy = savedData[["DefaultInputs"]][["Investor"]][["LifeExpectancy"]],
    InvestorRetirementAge = savedData[["DefaultInputs"]][["Investor"]][["RetirementAge"]],

## Investor Tax rates    
    FederalTaxRate = savedData[["DefaultInputs"]][["TaxRates"]][["FederalTaxRate"]],
    StateTaxRate = savedData[["DefaultInputs"]][["TaxRates"]][["StateTaxRate"]],
    CapitalGainsTaxRate = savedData[["DefaultInputs"]][["TaxRates"]][["CapitalGainsTaxRate"]],
    DividendTaxRate = savedData[["DefaultInputs"]][["TaxRates"]][["DividendTaxRate"]],
    
## Investor cash flows and goals
    InvestorCashFlows = savedData[["DefaultInputs"]][["InvestorCashFlows"]],
    InvestorGoals = savedData[["DefaultInputs"]][["InvestorGoals"]],
    
## name time series
    NameTimeSeries_TabAnalysisTwo_SecondSubTab = "Series_2"
  )
  
  return(theReactiveUserInputs)
}


SetInitialValues_ReactiveInnerVariables <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    savedData)
{
  nameFunctionForMessage <- "Mod_Viz_Svr_ReactiveVars$SetInitialValues_ReactiveInnerVariables() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theReactiveInnerVariables <- shiny::reactiveValues(
 
    PortfolioValue = savedData[["DefaultInnerVariables"]][["PortfolioValue"]],
    TotalValue = savedData[["DefaultInnerVariables"]][["TotalValue"]],
    DateLastUpdate = savedData[["DefaultInnerVariables"]][["DateLastUpdate"]],
    DateLastReport = savedData[["DefaultInnerVariables"]][["DateLastReport"]]
  )
  
  return(theReactiveInnerVariables)
}


SetInitialValues_ReactiveTriggers <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    savedData)
{
  nameFunctionForMessage <- "Mod_Viz_Svr_ReactiveVars$SetInitialValues_ReactiveTriggers() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theReactiveTriggers <- shiny::reactiveValues(
    
    ActionButton_TabSummary_TotalValue = NULL,
    ActionButton_TabSummary_DateLastReport = NULL
    
  )
  
  return(theReactiveTriggers)
}


RenderContent <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    savedData,
    outputIDs)
{
  nameFunctionForMessage <- "Mod_Viz_Svr_ReactiveVars$RenderContent() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theOutputIDs <- outputIDs
  
  return(theOutputIDs)
}


ObserveEvents_ReactiveUserInputs <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    regularInputs,
    reactiveInputs)
{
  nameFunctionForMessage <- "Mod_Viz_Svr_ReactiveVars$ObserveEvents_ReactiveUserInputs() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theReactiveUserInputs <- reactiveInputs
  
  theReactiveUserInputs <- ObserveEvents_InvestorInfo(
    input, output, session,  
    regularInputs = regularInputs,
    reactiveInputs = theReactiveUserInputs)
  
  theObjReactive_UserInputs <- ObserveEvents_TaxRates(
    input, output, session,  
    regularInputs = regularInputs,
    reactiveInputs = theReactiveUserInputs)  
  
  theObjReactive_UserInputs <- ObserveEvents_TimeSeries(
    input, output, session,  
    regularInputs = regularInputs,
    reactiveInputs = theReactiveUserInputs)
  
  return(theReactiveUserInputs)
}


ObserveEvents_InvestorInfo <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    regularInputs,
    reactiveInputs)
{
  nameFunctionForMessage <- "Mod_Viz_Svr_ReactiveVars$ObserveEvents_InvestorInfo() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theReactiveUserInputs <- reactiveInputs
  theInputs <- regularInputs
  
  shiny::observeEvent(
    
    eventExpr = theInputs$inputID_investorName, 
    
    handlerExpr = {
      theReactiveUserInputs[["InvestorName"]] <- theInputs$inputID_investorName
    })
  
  shiny::observeEvent(
    
    eventExpr = theInputs$inputID_investorDateOfBirth,
    
    handlerExpr = {
      theReactiveUserInputs[["InvestorDateOfBirth"]] <- theInputs$inputID_investorDateOfBirth
    })
  
  shiny::observeEvent(
    
    eventExpr = theInputs$inputID_investorLifeExpectancy,
    
    handlerExpr = {
      theReactiveUserInputs[["InvestorLifeExpectancy"]] <- theInputs$inputID_investorLifeExpectancy
    })
  
  shiny::observeEvent(
    
    eventExpr = theInputs$inputID_investorRetirementAge, 
    
    handlerExpr = {
      theReactiveUserInputs[["InvestorRetirementAge"]] <- theInputs$inputID_investorRetirementAge
    })
  
  shiny::observeEvent(
    
    eventExpr = theInputs$inputID_investorRiskTolerance, 
    
    handlerExpr = {
      theReactiveUserInputs[["InvestorRiskTolerance"]] <- theInputs$inputID_investorRiskTolerance
    })
  
  shiny::observeEvent(
    
    eventExpr = theInputs$outputID_TabData_inputInvestorCashFlows, 
    
## NOTE: When values are given through a rhandsontable, same ID is used for both output and input
    handlerExpr = {
      theReactiveUserInputs[["InvestorCashFlows"]] <- 
        rhandsontable::hot_to_r(theInputs$outputID_TabData_inputInvestorCashFlows)
    })  
  
  return(theReactiveUserInputs)
}


ObserveEvents_TaxRates <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    regularInputs,
    reactiveInputs)
{
  nameFunctionForMessage <- "Mod_Viz_Svr_ReactiveVars$ObserveEvents_TaxRates() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theReactiveUserInputs <- reactiveInputs
  theInputs <- regularInputs
  
  shiny::observeEvent(
    
    eventExpr = theInputs$inputID_federalTaxRate, 
    
    handlerExpr = {
      theReactiveUserInputs[["FederalTaxRate"]] <- theInputs$inputID_federalTaxRate
    })    
  
  shiny::observeEvent(
    
    eventExpr = theInputs$inputID_stateTaxRate, 
    
    handlerExpr = {
      theReactiveUserInputs[["StateTaxRate"]] <- theInputs$inputID_stateTaxRate
    })    
  
  shiny::observeEvent(
    
    eventExpr = theInputs$inputID_capitalGainsTaxRate, 
    
    handlerExpr = {
      theReactiveUserInputs[["CapitalGainsTaxRate"]] <- theInputs$inputID_capitalGainsTaxRate
    })    
  
  shiny::observeEvent(
    
    eventExpr = theInputs$inputID_dividendTaxRate, 
    
    handlerExpr = {
      theReactiveUserInputs[["DividendTaxRate"]] <- theInputs$inputID_dividendTaxRate
    })      
  
  return(theReactiveUserInputs)
}


ObserveEvents_TimeSeries <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    regularInputs,
    reactiveInputs)
{
  nameFunctionForMessage <- "Mod_Viz_Svr_ReactiveVars$ObserveEvents_TimeSeries() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theReactiveUserInputs <- reactiveInputs
  shiny::observeEvent(
    
    eventExpr = regularInputs$inputID_TabAnalysisOne_SecondSubTab_SelectTimeSeries, 
    
    handlerExpr = {
      theReactiveUserInputs[["NameTimeSeries_TabAnalysisOne_SecondSubTab"]] <- regularInputs$inputID_TabAnalysisOne_SecondSubTab_SelectTimeSeries
    }) 
  
  return(theReactiveUserInputs)
}


ObserveEvents_ReactiveTriggers <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    regularInputs,
    reactiveTriggers)
{
  nameFunctionForMessage <- "Mod_Viz_Svr_ReactiveVars$ObserveEvents_ReactiveTriggers() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theReactiveTriggers <- reactiveTriggers
  
  theReactiveTriggers <- ObserveEvents_ReactiveTriggers_TabSummary(
    input, output, session,  
    regularInputs = regularInputs,
    reactiveTriggers = reactiveTriggers)
  
  return(theReactiveTriggers)
}


ObserveEvents_ReactiveTriggers_TabSummary <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    regularInputs,
    reactiveTriggers)
{
  nameFunctionForMessage <- "Mod_Viz_Svr_ReactiveVars$ObserveEvents_ReactiveTriggers_TabSummary() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theReactiveTriggers <- reactiveTriggers
  theInputs <- regularInputs
  
  shiny::observeEvent(
    
    eventExpr = theInputs$inputID_ActionButton_TabSummary_TotalValue, 
    
    handlerExpr = {
      theReactiveTriggers[["ActionButton_TabSummary_TotalValue"]] <- 
        theInputs$inputID_ActionButton_TabSummary_TotalValue
  })
  
  shiny::observeEvent(
    
    eventExpr = theInputs$inputID_ActionButton_TabSummary_DateLastReport, 
    
    handlerExpr = {
      theReactiveTriggers[["ActionButton_TabSummary_DateLastReport"]] <- 
        theInputs$inputID_ActionButton_TabSummary_DateLastReport
  })  
  
  return(theReactiveTriggers)
}


ObserveEvents_ReactiveInnerVariables <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    regularInputs,
    reactiveVars)
{
  nameFunctionForMessage <- "Mod_Viz_Svr_ReactiveVars$ObserveEvents_ReactiveInnerVariables() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theReactiveInnerVariables <- reactiveVars
  
  theReactiveInnerVariables <- ObserveEvents_Temp(
    input, output, session,  
    regularInputs = regularInputs,
    reactiveVars = reactiveVars)
  
  return(theReactiveInnerVariables)
}


## Just a placeholder for now
ObserveEvents_Temp <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    regularInputs,
    reactiveVars)
{
  nameFunctionForMessage <- "Mod_Viz_Svr_ReactiveVars$ObserveEvents_Temp() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theReactiveInnerVars <- reactiveVars

  currentTotalValue <- shiny::isolate(expr = theReactiveInnerVars[["TotalValue"]])
  updatedTotalValue <- 1.10 * currentTotalValue
  theReactiveInnerVars[["TotalValue"]] <- updatedTotalValue
  
  return(theReactiveInnerVars)
}


})
