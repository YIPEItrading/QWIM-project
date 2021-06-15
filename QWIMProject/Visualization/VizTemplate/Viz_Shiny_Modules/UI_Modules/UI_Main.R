

Mod_Viz_UI_Main <- modules::module(
{

## packages that need to be explicitly imported within this module 
#    modules::import(from = "dplyr")  ## needed for %>%


## define local piping operator, to avoid loading dplyr package
    `%>%` <- dplyr::`%>%`


## local files or functions that have to be imported explicitly
#   nameForLocalUsage <- modules::use(module = "SomeName")  
    pathFile <- base::file.path('UI_Modules','UI_TabSettings.R')
    Mod_UI_TSt <- modules::use(module = pathFile)  
    pathFile <- base::file.path('UI_Modules','UI_TabData.R')
    Mod_UI_TDa <- modules::use(module = pathFile)
    pathFile <- base::file.path('UI_Modules','UI_TabAnalysisOne.R')
    Mod_UI_TA1 <- modules::use(module = pathFile)
    pathFile <- base::file.path('UI_Modules','UI_TabAnalysisTwo.R')
    Mod_UI_TA2 <- modules::use(module = pathFile)  
    pathFile <- base::file.path('UI_Modules','UI_TabAnalysisThree.R')
    Mod_UI_TA3 <- modules::use(module = pathFile)
    pathFile <- base::file.path('UI_Modules','UI_TabResultsOne.R')
    Mod_UI_TR1 <- modules::use(module = pathFile)
    pathFile <- base::file.path('UI_Modules','UI_TabResultsTwo.R')
    Mod_UI_TR2 <- modules::use(module = pathFile)
    pathFile <- base::file.path('UI_Modules','UI_TabSummary.R')
    Mod_UI_TSm <- modules::use(module = pathFile)


## functions exported from this module
    modules::export("DisplayDashboardHeader")
    modules::export("DisplayDashboardSidebar")
    modules::export("DisplayDashboardBody")
    modules::export("SetTabIDs_SidebarMenu")


DisplayDashboardHeader <- function(
    savedData,
    savedFuncs)
{
  nameFunctionForMessage <- "Mod_Viz_UI_Main$DisplayDashboardHeader() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <- semantic.dashboard::dashboardHeader(
    
    color = "blue",
    inverted = TRUE,
    
    DisplayDashboardHeader_Content(
      savedData = savedData,
      savedFuncs = savedFuncs)
  )
  
  return(theUI)
}  


DisplayDashboardHeader_Content <- function(
    savedData,
    savedFuncs)
{
  nameFunctionForMessage <- "Mod_Viz_UI_Main$DisplayDashboardHeader() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <- shiny::titlePanel(
    
          title = shiny::div(
              "Viz Template",
              shiny::img(
                src = "LogoGraphite.png",
                style = "float:right;"))
        
    )
  
  return(theUI)
}  


DisplayDashboardSidebar <- function(
    savedData,
    savedFuncs,
    tabIDs)
{
  nameFunctionForMessage <- "Mod_Viz_UI_Main$DisplayDashboardSidebar() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <- semantic.dashboard::dashboardSidebar(
    
    size = "thin", 
    color = "teal",
    
    DisplayDashboardSidebar_Content(
      savedData = savedData,
      savedFuncs = savedFuncs,
      tabIDs = tabIDs)
  )
  
  return(theUI)
}


DisplayDashboardSidebar_Content <- function(
    savedData,
    savedFuncs,
    tabIDs)
{
  nameFunctionForMessage <- "Mod_Viz_UI_Main$DisplayDashboardSidebar_Content() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <- semantic.dashboard::sidebarMenu(
   
    DisplayDashboardSidebar_TabCategorySetup(
      savedData = savedData,
      savedFuncs = savedFuncs,
      tabIDs = tabIDs),
   
    DisplayDashboardSidebar_TabCategoryAnalysis(
      savedData = savedData,
      savedFuncs = savedFuncs,
      tabIDs = tabIDs),

    DisplayDashboardSidebar_TabCategoryResults(
      savedData = savedData,
      savedFuncs = savedFuncs,
      tabIDs = tabIDs)
   
  )
  
  return(theUI)
} 


DisplayDashboardSidebar_TabCategorySetup <- function(
    savedData,
    savedFuncs,
    tabIDs)
{
  nameFunctionForMessage <- "Mod_Viz_UI_Main$DisplayDashboardSidebar_TabCategorySetup() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  thetabIDs <- tabIDs
  
  theUI <- semantic.dashboard::menuItem(
    
      tabName = thetabIDs[["ID_TabCategorySetup"]],
      text = "TheSetup", ## "Setup",
      icon = semantic.dashboard::icon(type = "sitemap"),
      
      semantic.dashboard::menuItem(
        tabName = thetabIDs[["ID_TabSettings"]],
        text = "Settings",
        icon = semantic.dashboard::icon(type = "sitemap")),
      
      semantic.dashboard::menuItem(
        tabName = thetabIDs[["ID_TabData"]], 
        text = "Data",
        icon = semantic.dashboard::icon(type = "tasks"))
  )
  
  return(theUI)
} 


DisplayDashboardSidebar_TabCategoryAnalysis <- function(
    savedData,
    savedFuncs,
    tabIDs)
{
  nameFunctionForMessage <- "Mod_Viz_UI_Main$DisplayDashboardSidebar_TabCategoryAnalysis() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  thetabIDs <- tabIDs
  
  theUI <- semantic.dashboard::menuItem(
  
    tabName = thetabIDs[["ID_TabCategoryAnalysis"]],
    text = "Analysis",
    icon = semantic.dashboard::icon(type = "sitemap"),

    semantic.dashboard::menuItem(
      tabName = thetabIDs[["ID_TabAnalysisOne"]],
      text = "AnalysisOne",
      icon = semantic.dashboard::icon(type = "object group outline")),
   
    semantic.dashboard::menuItem(
      tabName = thetabIDs[["ID_TabAnalysisTwo"]], 
      text = "AnalysisTwo",
      icon = semantic.dashboard::icon(type = "signal")),
   
    semantic.dashboard::menuItem(
      tabName = thetabIDs[["ID_TabAnalysisThree"]],
      text = "AnalysisThree",
      icon = semantic.dashboard::icon(type = "database"))

  )
  
  return(theUI)
} 


DisplayDashboardSidebar_TabCategoryResults <- function(
    savedData,
    savedFuncs,
    tabIDs)
{
  nameFunctionForMessage <- "Mod_Viz_UI_Main$DisplayDashboardSidebar_TabCategoryResults() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  thetabIDs <- tabIDs
  
  theUI <- semantic.dashboard::menuItem(
    
    tabName = thetabIDs[["ID_TabCategoryResults"]],
    text = "Results",
    icon = semantic.dashboard::icon(type = "sitemap"),
    
    semantic.dashboard::menuItem(
      tabName = thetabIDs[["ID_TabResultsOne"]], 
      text = "ResultsOne",
      icon = semantic.dashboard::icon(type = "object group outline")),
    
    semantic.dashboard::menuItem(
      tabName = thetabIDs[["ID_TabResultsTwo"]], 
      text = "ResultsTwo",
      icon = semantic.dashboard::icon(type = "signal")),
    
    semantic.dashboard::menuItem(
      tabName = thetabIDs[["ID_TabSummary"]], 
      text = "Summary",
      icon = semantic.dashboard::icon(type = "balance scale"))
  )

  return(theUI)
} 


DisplayDashboardBody <- function(
    savedData,
    savedFuncs,
    tabIDs)
{
  nameFunctionForMessage <- "Mod_Viz_UI_Main$DisplayDashboardBody() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <- semantic.dashboard::dashboardBody(
    
## https://stackoverflow.com/questions/55871981/how-to-fix-the-layout-of-semantic-dashboard        
    shiny::tags$style(".pusher.container .ui.segment .ui.stackable.container.grid {margin:0px!important;}"),
    
    DisplayDashboardBody_Content(
      savedData = savedData,
      savedFuncs = savedFuncs,
      tabIDs = tabIDs)
    
  )
  return(theUI)
}


DisplayDashboardBody_Content <- function(
    savedData,
    savedFuncs,
    tabIDs)
{
  nameFunctionForMessage <- "Mod_Viz_UI_Main$DisplayDashboardBody_Content() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  theUI <- semantic.dashboard::tabItems(

    selected = 1,  ##CH June 2021    2

    semantic.dashboard::tabItem(

      tabName = tabIDs[["ID_TabSettings"]],  ## needs to be consistent with tabID defined in DisplayDashboardSidebar

      Mod_UI_TSt$Mod_Viz_UI_TabSettings$DisplayContent(
        savedData = savedData,
        savedFuncs = savedFuncs)),

    semantic.dashboard::tabItem(

      tabName = tabIDs[["ID_TabData"]], ## needs to be consistent with tabID defined in DisplayDashboardSidebar

      Mod_UI_TDa$Mod_Viz_UI_TabData$DisplayContent(
        savedData = savedData,
        savedFuncs = savedFuncs)),
    
    semantic.dashboard::tabItem(

      tabName = tabIDs[["ID_TabAnalysisOne"]],  ## needs to be consistent with tabID defined in DisplayDashboardSidebar

      Mod_UI_TA1$Mod_Viz_UI_TabAnalysisOne$DisplayContent(
        savedData = savedData,
        savedFuncs = savedFuncs)),

    semantic.dashboard::tabItem(

      tabName = tabIDs[["ID_TabAnalysisTwo"]],  ## needs to be consistent with tabID defined in DisplayDashboardSidebar

      Mod_UI_TA2$Mod_Viz_UI_TabAnalysisTwo$DisplayContent(
        savedData = savedData,
        savedFuncs = savedFuncs)),

    semantic.dashboard::tabItem(

      tabName = tabIDs[["ID_TabAnalysisThree"]],  ## needs to be consistent with tabID defined in DisplayDashboardSidebar

      Mod_UI_TA3$Mod_Viz_UI_TabAnalysisThree$DisplayContent(
        savedData = savedData,
        savedFuncs = savedFuncs)),

    semantic.dashboard::tabItem(

      tabName = tabIDs[["ID_TabResultsOne"]],  ## needs to be consistent with tabID defined in DisplayDashboardSidebar

      Mod_UI_TR1$Mod_Viz_UI_TabResultsOne$DisplayContent(
        savedData = savedData,
        savedFuncs = savedFuncs)),

    semantic.dashboard::tabItem(

      tabName = tabIDs[["ID_TabResultsTwo"]],  ## needs to be consistent with tabID defined in DisplayDashboardSidebar

      Mod_UI_TR2$Mod_Viz_UI_TabResultsTwo$DisplayContent(
        savedData = savedData,
        savedFuncs = savedFuncs)),

    Mod_UI_TSm$Mod_Viz_UI_TabSummary$DisplayContent(
      savedData = savedData,
      savedFuncs = savedFuncs,
      tabIDs = tabIDs)

  )
  
  return(theUI)
} 


SetTabIDs_SidebarMenu <- function()
{
  nameFunctionForMessage <- "Mod_Viz_UI_Main$SetTabIDs_SidebarMenu() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  tabIDs <- tibble::tibble(
    ID_TabCategorySetup    = "ID_UI_sidebarMenu_CategorySetup", ## for Setup
    ID_TabCategoryAnalysis = "ID_UI_sidebarMenu_CategoryAnalysis", ## for Analysis
    ID_TabCategoryResults  = "ID_UI_sidebarMenu_CategoryResults", ## for Results
    ID_TabSettings         = "ID_UI_sidebarMenu_Settings", ## for Settings tab
    ID_TabData             = "ID_UI_sidebarMenu_Data",     ## for Data tab
    ID_TabAnalysisOne      = "ID_UI_sidebarMenu_AnalysisOne",   ## for first analysis tab
    ID_TabAnalysisTwo      = "ID_UI_sidebarMenu_AnalysisTwo",   ## for second analysis tab
    ID_TabAnalysisThree    = "ID_UI_sidebarMenu_AnalysisThree",   ## for third analysis tab
    ID_TabResultsOne       = "ID_UI_sidebarMenu_TabResultsOne",   ## for first Results tab
    ID_TabResultsTwo       = "ID_UI_sidebarMenu_TabResultsTwo",   ## for second Results tab
    ID_TabSummary          = "ID_UI_sidebarMenu_TabSummary"   ## for Summary Results tab
  )
  
  return(tabIDs)
}


})   ## end of mod_Viz_UI_Main
