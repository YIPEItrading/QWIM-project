
Mod_Viz_Server_TabData <- modules::module(
{

## packages that need to be explicitly imported within this module 
#    modules::import(from = "dplyr")  ## needed for %>%


## define local piping operator, to avoid loading dplyr package
    `%>%` <- dplyr::`%>%`


## local files or functions that have to be imported explicitly
#   nameForLocalUsage <- modules::use(module = "SomeName")  
    pathFile <- base::file.path('UI_Modules','UI_TabData.R')
    Mod_UI_TDa <- modules::use(module = pathFile)

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
  nameFunctionForMessage <- "Mod_Viz_Server_TabData$RenderContent() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theOutputIDs <- outputIDs
  
  theOutputIDs <- shiny::callModule(
      module = RenderContent_InvestorInfo,
      id = "ID_Mod_Viz_Server_TabData_RenderContent_InvestorInfo",
      savedData = savedData,
      savedFuncs = savedFuncs,
      outputIDs = theOutputIDs)
  
  theOutputIDs$outputID_TabData_SampleInputInvestorCashFlows <- rhandsontable::renderRHandsontable({
    theOutput <- shiny::callModule(
      module = Mod_UI_TDa$Mod_Viz_UI_TabData$DisplaySampleInvestorCashFlows,
      id = "ID_Mod_Viz_UI_TabData_DisplaySampleInvestorCashFlows",
      savedData = savedData,
      savedFuncs = savedFuncs,
      reactiveInputs = reactiveInputs) 
  })  
  
  return(theOutputIDs)
}


RenderContent_InvestorInfo <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    savedData,
    savedFuncs,
    outputIDs)
{
  nameFunctionForMessage <- "Mod_Viz_Svr_ReactiveVars$RenderContent_InvestorInfo() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theOutputIDs <- outputIDs
  theOutputIDs$outputID_inputInvestorName <- shiny::renderUI({
    theOutput <- shiny::callModule(
      module = Mod_UI_TDa$Mod_Viz_UI_TabData$SetInvestorName,
      id = "ID_Mod_Viz_UI_TabData_SetInvestorName",
      initialValue = savedData[["DefaultInputs"]][["Investor"]][["Name"]])
  })
  
  theOutputIDs$outputID_inputInvestorDateOfBirth <- shiny::renderUI({
    theOutput <- shiny::callModule(
      module = Mod_UI_TDa$Mod_Viz_UI_TabData$SetInvestorDateOfBirth,
      id = "ID_Mod_Viz_UI_TabData_SetInvestorDateOfBirth",
      dateOfBirth = savedData[["DefaultInputs"]][["Investor"]][["DateOfBirth"]])
  })
  
  theOutputIDs$outputID_inputInvestorLifeExpectancy <- shiny::renderUI({
    theOutput <- shiny::callModule(
      module = Mod_UI_TDa$Mod_Viz_UI_TabData$SetInvestorLifeExpectancy,
      id = "ID_Mod_Viz_UI_TabData_SetInvestorLifeExpectancy",
      lifeExpectancy = savedData[["DefaultInputs"]][["Investor"]][["LifeExpectancy"]]) 
  })
  
  theOutputIDs$outputID_inputInvestorRetirementAge <- shiny::renderUI({
    theOutput <- shiny::callModule(
      module = Mod_UI_TDa$Mod_Viz_UI_TabData$SetInvestorRetirementAge,
      id = "ID_Mod_Viz_UI_TabData_SetInvestorRetirementAge",
      retirementAge = savedData[["DefaultInputs"]][["Investor"]][["RetirementAge"]])  
  })
  
  return(theOutputIDs)
}


RenderContent_TaxRates <- function(
## the first three arguments of the function have to be input, output and session
    input, output, session,  
## the regular function arguments
    savedData,
    outputIDs)
{
  nameFunctionForMessage <- "Mod_Viz_Svr_ReactiveVars$RenderContent_TaxRates() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theOutputIDs <- outputIDs
  theOutputIDs$outputID_inputFederalTaxRate <- shiny::renderUI({
    theOutput <- shiny::callModule(
      module = Mod_UI_TDa$Mod_Viz_UI_TabData$SetFederalTaxRate,
      id = "ID_Mod_Viz_UI_TabData_SetFederalTaxRate",
      taxRate = savedData[["DefaultInputs"]][["TaxRates_Individual"]][["FederalTaxRate"]]) 
  })
  
  theOutputIDs$outputID_inputStateTaxRate <- shiny::renderUI({
    theOutput <- shiny::callModule(
      module = Mod_UI_TDa$Mod_Viz_UI_TabData$SetStateTaxRate,
      id = "ID_Mod_Viz_UI_TabData_SetStateTaxRate",
      taxRate = savedData[["DefaultInputs"]][["TaxRates_Individual"]][["StateTaxRate"]])
  })
  
  theOutputIDs$outputID_inputCapitalGainsTaxRate <- shiny::renderUI({
    theOutput <- shiny::callModule(
      module = Mod_UI_TDa$Mod_Viz_UI_TabData$SetCapitalGainsTaxRate,
      id = "ID_Mod_Viz_UI_TabData_SetCapitalGainsTaxRate",
      taxRate = savedData[["DefaultInputs"]][["TaxRates_Individual"]][["CapitalGainsTaxRate"]])
  })
  
  theOutputIDs$outputID_inputDividendTaxRate <- shiny::renderUI({
    theOutput <- shiny::callModule(
      module = Mod_UI_TDa$Mod_Viz_UI_TabData$SetDividendTaxRate,
      id = "ID_Mod_Viz_UI_TabData_SetDividendTaxRate",
      taxRate = savedData[["DefaultInputs"]][["TaxRates_Individual"]][["DividendTaxRate"]])
  })
  
  return(theOutputIDs)
}


})
