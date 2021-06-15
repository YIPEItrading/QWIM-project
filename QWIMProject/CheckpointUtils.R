
GetVersionR <- function()
{
  
  nameFunctionForMessage <- "GetVersionR() "    
  ##  reportr::setOutputLevel(reportr::OL$Error)  
  
  theVersionR <- base::R.Version()
  
  versionR_Checkpoint <- base::paste0(theVersionR$major,".",theVersionR$minor)
  VersionR <- base::paste0("VersionR.",theVersionR$major,".",theVersionR$minor)
  VersionR <- base::gsub(pattern = ".", 
                           replacement = "_", 
                           x = VersionR, 
                           fixed = TRUE)
  
  infoVersionR <- list()
  infoVersionR[["versionR_Checkpoint"]] <- versionR_Checkpoint
  infoVersionR[["VersionR"]] <- VersionR
  
  return(infoVersionR)
}


GetPathFolderCheckpoint <- function(snapshotDate_GPFC)
{
  VersionR <- GetVersionR()
  pathMyDocumentsFolder <- base::path.expand('~')
  pathFolder <- base::file.path(pathMyDocumentsFolder,".checkpoint", snapshotDate_GPFC,
                                "lib","x86_64-w64-mingw32", VersionR)
  return(pathFolder)
}


GetPathFolderLocalRepo <- function()
{
##  base::stop("the path for Local_Repo_R folder has to be updated ")
## the path for Local_Repo_R folder has to be updated 
  pathFolderLocalRepos <-  base::file.path('Local_Repo_R')
  return(pathFolderLocalRepos)
}


SetupSnapshot <- function(
    snapshotDate,
    useLocalRepo = TRUE)
{
  
  nameFunctionForMessage <- "SetupSnapshot() "    
  ##  reportr::setOutputLevel(reportr::OL$Error)  
  
  infoVersionR <- GetVersionR()
  VersionR <- infoVersionR$VersionR
  versionR_Checkpoint <- infoVersionR$versionR_Checkpoint
  
  ##  theCheckpointFolder <- base::file.path(base::getwd(),"Checkpoint_Repo")
  ## snapshot has some issues if a different folder is used instead of default one
  theCheckpointFolder <- "~/"
  if (!(base::dir.exists(theCheckpointFolder))) {
    base::dir.create(theCheckpointFolder)
  }
  
  pathFolderLocalRepos <-  GetPathFolderLocalRepo()
  
  if (VersionR == "VersionR_3_4_3") {
    theMessage <- base::paste0("VersionR = ", VersionR, " is not an acceptable selection")
    base::stop(theMessage)
  } else if (VersionR == "VersionR_3_4_4") {
    theMessage <- base::paste0("VersionR = ", VersionR, " is not an acceptable selection")
    base::stop(theMessage)
  } else if (VersionR == "VersionR_3_5_0") {
    theMessage <- base::paste0("VersionR = ", VersionR, " is not an acceptable selection")
    base::stop(theMessage)
  } else if (VersionR == "VersionR_3_5_1") {
    checkpointSnapshotDate <- snapshotDate 
    pathLocalRepo <- base::file.path(pathFolderLocalRepos, "Pkgs_VersionR_3_5_1","snapshot", checkpointSnapshotDate)
  } else if (VersionR == "VersionR_3_5_2") {
    checkpointSnapshotDate <- snapshotDate 
    pathLocalRepo <- base::file.path(pathFolderLocalRepos, "Pkgs_VersionR_3_5_2","snapshot", checkpointSnapshotDate)
  } else if (VersionR == "VersionR_3_5_3") {
    checkpointSnapshotDate <- snapshotDate 
    pathLocalRepo <- base::file.path(pathFolderLocalRepos, "Pkgs_VersionR_3_5_3","snapshot", checkpointSnapshotDate)
  } else if (VersionR == "VersionR_3_6_0") {
    checkpointSnapshotDate <- snapshotDate 
    pathLocalRepo <- base::file.path(pathFolderLocalRepos, "Pkgs_VersionR_3_6_0","snapshot", checkpointSnapshotDate)
  } else if (VersionR == "VersionR_3_6_1") {
    checkpointSnapshotDate <- snapshotDate 
    pathLocalRepo <- base::file.path(pathFolderLocalRepos, "Pkgs_VersionR_3_6_1","snapshot", checkpointSnapshotDate)
  } else if (VersionR == "VersionR_3_6_2") {
    checkpointSnapshotDate <- snapshotDate 
    pathLocalRepo <- base::file.path(pathFolderLocalRepos, "Pkgs_VersionR_3_6_2","snapshot", checkpointSnapshotDate)
  } else if (VersionR == "VersionR_3_6_3") {
    checkpointSnapshotDate <- snapshotDate 
    pathLocalRepo <- base::file.path(pathFolderLocalRepos, "Pkgs_VersionR_3_6_3","snapshot", checkpointSnapshotDate)
  } else if (VersionR == "VersionR_4_0_0") {
    checkpointSnapshotDate <- snapshotDate 
    pathLocalRepo <- base::file.path(pathFolderLocalRepos, "Pkgs_VersionR_4_0_0","snapshot", checkpointSnapshotDate)
  } else if (VersionR == "VersionR_4_0_1") {
    checkpointSnapshotDate <- snapshotDate 
    pathLocalRepo <- base::file.path(pathFolderLocalRepos, "Pkgs_VersionR_4_0_1","snapshot", checkpointSnapshotDate)
  } else if (VersionR == "VersionR_4_0_2") {
    checkpointSnapshotDate <- snapshotDate 
    pathLocalRepo <- base::file.path(pathFolderLocalRepos, "Pkgs_VersionR_4_0_2","snapshot", checkpointSnapshotDate)
  } else if (VersionR == "VersionR_4_0_3") {
    checkpointSnapshotDate <- snapshotDate 
    pathLocalRepo <- base::file.path(pathFolderLocalRepos, "Pkgs_VersionR_4_0_3","snapshot", checkpointSnapshotDate)
  } else if (VersionR == "VersionR_4_0_4") {
    checkpointSnapshotDate <- snapshotDate 
    pathLocalRepo <- base::file.path(pathFolderLocalRepos, "Pkgs_VersionR_4_0_4","snapshot", checkpointSnapshotDate)
  } else if (VersionR == "VersionR_4_0_5") {
    checkpointSnapshotDate <- snapshotDate 
    pathLocalRepo <- base::file.path(pathFolderLocalRepos, "Pkgs_VersionR_4_0_5","snapshot", checkpointSnapshotDate)
  } else if (VersionR == "VersionR_4_1_0") {
    checkpointSnapshotDate <- snapshotDate 
    pathLocalRepo <- base::file.path(pathFolderLocalRepos, "Pkgs_VersionR_4_1_0","snapshot", checkpointSnapshotDate)
  } else {
    theMessage <- base::paste0("VersionR = ", VersionR, " is not an acceptable selection")
    base::stop(theMessage)
  }  
  
  localRepo <- base::file.path('file:', '', pathLocalRepo)
  
  originalCheckpointURL <- base::getOption("checkpoint.mranUrl")
  
  if (!useLocalRepo) {
    localRepo <- NULL
  }
  base::options(checkpoint.mranUrl = localRepo)
  
  reposInUse <- base::getOption("repos")
  theMessage <- base::paste0("ReposInUse = ", reposInUse, "\n\n")
  base::cat(theMessage)
  
  theMessage <- base::paste0("LocalRepoToUseForCheckpoint = ", localRepo, "\n\n")
  base::cat(theMessage)
  
  theMessage <- base::paste0("Snapshot date = ", checkpointSnapshotDate, "\n\n")
  base::cat(theMessage)
  
  checkpoint::checkpoint(
    snapshot_date = checkpointSnapshotDate,
    r_version = versionR_Checkpoint,
    checkpoint_location = theCheckpointFolder)
  
}


InspectResultsCheckpoint <- function()
{
  
  base::cat("Check that library path is set to checkpoint folder\n \n")
  thePaths <- base::normalizePath(path = .libPaths(), 
                                  winslash = "/")
  base::print(thePaths)
  
  base::cat("These packages are installed in checkpoint library\n \n")
  utils::installed.packages(.libPaths()[1])[, "Package"]
  
}


RemoveCheckpointArchive <- function(snapshotDate)
{
  versionR <- base::R.Version()
  
  versionR_Checkpoint <- base::paste0(versionR$major,".",versionR$minor)
  VersionR <- base::paste0("VersionR.",versionR$major,".",versionR$minor)
  VersionR <- base::gsub(pattern = ".", 
                           replacement = "_", 
                           x = VersionR, 
                           fixed = TRUE)
  
  if (VersionR == "VersionR_3_4_3") {
    theMessage <- base::paste0("VersionR = ", VersionR, " is not an acceptable selection")
    base::stop(theMessage)
  } else if (VersionR == "VersionR_3_4_4") {
    theMessage <- base::paste0("VersionR = ", VersionR, " is not an acceptable selection")
    base::stop(theMessage)
  } else if (VersionR == "VersionR_3_5_0") {
    theMessage <- base::paste0("VersionR = ", VersionR, " is not an acceptable selection")
    base::stop(theMessage)
  } else if (VersionR == "VersionR_3_5_1") {
    checkpointSnapshotDate <- snapshotDate 
  } else if (VersionR == "VersionR_3_5_2") {
    checkpointSnapshotDate <- snapshotDate 
  } else if (VersionR == "VersionR_3_6_0") {
    checkpointSnapshotDate <- snapshotDate 
  } else if (VersionR == "VersionR_3_6_1") {
    checkpointSnapshotDate <- snapshotDate 
  } else if (VersionR == "VersionR_3_6_2") {
    checkpointSnapshotDate <- snapshotDate 
  } else if (VersionR == "VersionR_3_6_3") {
    checkpointSnapshotDate <- snapshotDate 
  } else if (VersionR == "VersionR_4_0_0") {
    checkpointSnapshotDate <- snapshotDate 
  } else if (VersionR == "VersionR_4_0_1") {
    checkpointSnapshotDate <- snapshotDate 
  } else if (VersionR == "VersionR_4_0_2") {
    checkpointSnapshotDate <- snapshotDate 
  } else if (VersionR == "VersionR_4_0_3") {
    checkpointSnapshotDate <- snapshotDate 
  } else if (VersionR == "VersionR_4_0_4") {
    checkpointSnapshotDate <- snapshotDate 
  } else if (VersionR == "VersionR_4_0_5") {
    checkpointSnapshotDate <- snapshotDate 
  } else if (VersionR == "VersionR_4_1_0") {
    checkpointSnapshotDate <- snapshotDate 
  } else {
    theMessage <- base::paste0("VersionR = ", VersionR, " is not an acceptable selection")
    base::stop(theMessage)
  }  
  
  ##  theCheckpointFolder <- base::file.path(base::getwd(),"Checkpoint_Repo")
  ## snapshot have some issues if a different folder is used instead of default one
  theCheckpointFolder <- "~/" 
  
  checkpoint::checkpointRemove(snapshotDate = checkpointSnapshotDate,
                               checkpointLocation = theCheckpointFolder)
}


InstallPackages_ExplicitVersion <- function()
{
  
  nameFunctionForMessage <- "InstallPackages_ExplicitVersion() " 
  
    thePaths <- base::normalizePath(path = .libPaths(),
                                    winslash = "/")

    theVersionPackage <- utils::packageVersion(pkg = "RcppParallel",
                                               lib.loc = thePaths[1])
    if (theVersionPackage != "5.0.1") {
      utils::install.packages(pkgs = "https://cran.r-project.org/src/contrib/RcppParallel_5.0.1.zip",
                              repo = NULL,
                              type = "win.binary")
    }
    
    theVersionPackage <- utils::packageVersion(pkg = "tidyr",
                                               lib.loc = thePaths[1])
    if (theVersionPackage != "1.0.3") {
      utils::install.packages(pkgs = "https://cran.r-project.org/src/contrib/tidyr_1.0.3.zip",
                              repo = NULL,
                              type = "win.binary")
    }

    theVersionPackage <- utils::packageVersion(pkg = "openxlsx",
                                               lib.loc = thePaths[1])
    if (theVersionPackage != "4.1.5") {
      utils::install.packages(pkgs = "https://cran.r-project.org/src/contrib/openxlsx_4.1.5.zip",
                              repo = NULL,
                              type = "win.binary")
    }
  
}


InstallPackages_Overlay <- function(
    packagesToCheck,
    snapshotDate,
    installFromSource = FALSE)
{
  
  nameFunctionForMessage <- "InstallPackages_Overlay() "
  
  if (installFromSource) {
    typeInstall <- "source"
  } else {
    typeInstall <- "win.binary"
  }
  
  repoToInstallFrom <- base::paste0("https://cran.microsoft.com/snapshot/", 
                                    snapshotDate, "/")
  
  whereToCheck <- GetPathFolderCheckpoint(snapshotDate_GPFC = snapshotDate)
  installPackagesIsNeeded <- ((packagesToCheck %in% utils::installed.packages(lib.loc = whereToCheck)[, 1]) == FALSE)
  needToInstallVect <- ifelse(test = installPackagesIsNeeded, 
                              yes = TRUE, 
                              no = FALSE)
  needToInstall <- base::any(needToInstallVect)
  if (needToInstall) {
    utils::install.packages(pkgs = packagesToCheck[needToInstallVect],
                            repos = repoToInstallFrom)
                          #  type = typeInstall)
    
  }
}


InstallPackagesFromZip <- function(
  packagesZip,
  pathFolderZip = base::file.path('Local_Repo_R', 'NonCRAN_Packages'))
{
  nameFunctionForMessage <- "InstallPackagesFromZip() "    
  reportr::setOutputLevel(reportr::OL$Error)
  
  for (idxPackage in base::seq_along(packagesZip))
  {
    namePackage <- packagesZip[idxPackage]
    if (!base::is.element(namePackage, utils::installed.packages()[,1])) {
      nameFileZip <- base::paste0(namePackage, "-master.zip")
      path_fileZip <- base::file.path(pathFolderZip, nameFileZip)
      utils::unzip(zipfile = path_fileZip)
      nameTempFolder <- base::paste0(namePackage, "-master")
      devtools::install_local(path = nameTempFolder) 
      if (base::file.exists(nameTempFolder)) base::unlink(x = nameTempFolder, 
                                                          recursive = TRUE)
    }
  }
}


InstallPackagesLocal <- function()
{
## install packages from local files (.tar.gz or .zip)
  
  isPackageNotInstalled <-  (!base::is.element("semantic.dashboard", utils::installed.packages()[,1]))
  theVersionPackage <- NULL
  if (!isPackageNotInstalled) {
    theVersionPackage <- utils::packageVersion(pkg = "semantic.dashboard",
                                             lib.loc = thePaths[1])
  }
  if (isPackageNotInstalled || theVersionPackage != "0.2.0") {
    pathToLocalPackage <- base::file.path(base::getwd(),"LocalRepo","semantic.dashboard_0.2.0.tar.gz")
    devtools::install_local(path = pathToLocalPackage)
  }
  
}


## asOfDateForCRAN_string <- "2019-04-25"
## repoAsOfDate <- base::paste0("https://cran.microsoft.com/snapshot/", asOfDateForCRAN_string, "/")
## base::options(repos = repoAsOfDate)

