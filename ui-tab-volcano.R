
fluidPage(column(width = 3,
                 
                 wellPanel(
                   
                   h4("Volcano Plot Parameters:"),

                   selectInput("pval", "pvalue type", choices = c("raw", "adjusted"), selected = "raw"),
                   
                   conditionalPanel(condition = "input.pval == 'adjusted'",
                                    selectInput("method", "pvalue Adustment Method:",
                                                choices = c("holm", "hochberg", "hommel", "bonferroni", "BH", "BY", "fdr"), 
                                                selected = "fdr")),
                   
                   numericInput("pval_cutoff", "pvalue cutoff", value = 0.05),
                   numericInput("log2FC", "log2 Fold Change cutoff", value = 1.5),
                   numericInput("xlim", "x-label limit", value = 5)
                   
                   )
                 ),
          
          column(width = 9,
                 
                 plotlyOutput("volcano")
                 
                 ))

