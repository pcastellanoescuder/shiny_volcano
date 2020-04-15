
datasetInput <- reactive({
  
  infile <- input$myfile
  
  if (is.null(infile)){
    return(NULL)
  }
  
  else {
    data <- readxl::read_excel(infile$datapath) %>%
      column_to_rownames("name")
  }
})

##

output$toptable <- DT::renderDataTable({
  
  datatable(datasetInput(), 
            class = 'cell-border stripe', 
            rownames = TRUE, options(list(scrollX = TRUE)))
  
})


