
output$volcano <- renderPlotly({
  
  df <- datasetInput()
  
  names <- df$SymbolsA
  
  df <- df %>% mutate(adj.P.Val = p.adjust(P.Value, method = input$method))  
  
  if(input$pval == "raw"){
    
    df <- data.frame(pvalue = df$P.Value, FC = round(df$logFC, 2), names = names)
    
  }
  
  else {
    
    df <- data.frame(pvalue = df$adj.P.Val, FC = round(df$logFC, 2), names = names)
    
  }
  
  log2FC <- input$log2FC
  
  df <- mutate(df, threshold = as.factor(ifelse(df$pvalue >= input$pval_cutoff,
                                                yes = "none",
                                                no = ifelse(df$FC < log2FC,
                                                            yes = ifelse(df$FC < -log2FC,
                                                                         yes = "Down-regulated",
                                                                         no = "none"),
                                                            no = "Up-regulated"))))
    num_selected <- nrow(df[df$threshold != "none" ,])

    ggplotly(ggplot(data = df, aes(x = FC, y = -log10(pvalue), color = threshold, labels = names)) +
               geom_point(size = 1.75, alpha = 0.8) +
               xlim(c(-(input$xlim), input$xlim)) +
               xlab("log2 Fold Change") +
               ylab("-log10 p-value") +
               ggtitle(paste0(num_selected, " genes selected!")) +
               scale_y_continuous(trans = "log1p") +
               geom_vline(xintercept = -log2FC, colour = "black", linetype = "dashed") +
               geom_vline(xintercept = log2FC, colour = "black", linetype = "dashed") +
               geom_hline(yintercept = -log10(input$pval_cutoff), colour = "black", linetype = "dashed") +
               theme(legend.position = "none") +
               theme_bw() +
               labs(color = "") +
               scale_color_manual(values = c("Down-regulated" = "#E64B35", "Up-regulated" = "#3182bd", "none" = "#636363")))
    
})

