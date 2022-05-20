
library(shiny)
library(shinyjs)
library(knitr)
library(rmarkdown)
library(mailR)
library(googlesheets4)

source("settings.txt")
source("helpers.R")
log.spreadsheet.id <- app.settings$log.spreadsheet.id
options(gargle_verbosity = "debug")
# options(timeout = 90)
# For RStudio debugging only, in order to prevent logging via gsheets which takes time
offline <<- app.settings$offline.for.debugging #TRUE #FALSE

if(!offline){
  # suppressMessages(gs_auth(token = "googlesheets_token.rds", verbose = FALSE))
 # googlesheets4::gs4_auth(cache = ".", email = TRUE, use_oob=TRUE)
  googlesheets4::gs4_auth(
    email = TRUE,#app.settings$email.username,
    path = NULL,
    scopes = "https://www.googleapis.com/auth/spreadsheets",
    cache = "creds",
    use_oob = FALSE,
    token = NULL
  )
}

shiny::addResourcePath("shinyjs", system.file("srcjs", package = "shinyjs"))