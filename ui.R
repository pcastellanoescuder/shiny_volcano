
source("helpers.R")

dashboardPage(skin = "blue",
              
  dashboardHeader(title = "Volcano Plot Example"),
  
  dashboardSidebar(sidebarMenu(
    menuItem("Input Data", tabName = "inputdata"),
    menuItem("Volcano Plot", tabName = "volcano")

  )),

  dashboardBody(

    tabItems(
      tabItem(tabName = "inputdata",
              source("ui-tab-inputdata.R",local=TRUE)$value),
      tabItem(tabName = "volcano",
              source("ui-tab-volcano.R",local=TRUE)$value)
      ),

    tags$hr(),

    ## FOOTER

    tags$footer(p(h5((strong("Pol Castellano Escuder and Alex Sánchez Pla")), align="center",width=3),
              p(("Statistics and Bioinformatics Research Group"), align="center",width=3),
              p(("University of Barcelona"),align="center",width = 3)
              ))
  )
)

