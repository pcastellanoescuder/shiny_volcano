
options(shiny.maxRequestSize = 100*1024^2)

source("helpers.R")
print(sessionInfo())

shinyServer(function(input, output, session) {

  source("server-inputdata.R",local = TRUE)
  source("server-volcano.R",local = TRUE)

})

