
tabPanel("Input Data",
         fluidRow(
           column(width = 3,
                  
                  fileInput("myfile","Upload your top table (.xlsx):")
                  
                  ),
           
           column(width = 9,
                  
                  DT::dataTableOutput("toptable")
                  
                  ))
         )

