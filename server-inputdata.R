
datasetInput <- reactive({
  
  infile <- input$myfile
  
  if (is.null(infile)){
    return(NULL)
  }
  
  else {
    data <- readr::read_csv2(infile$datapath)
  }
})

##

output$toptable <- DT::renderDataTable({
  
  datatable(datasetInput(), 
            class = 'cell-border stripe', 
            rownames = FALSE, options(list(scrollX = TRUE)))
  
})


