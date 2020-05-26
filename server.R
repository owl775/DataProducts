shinyServer(
  function(input, output) {
    # create dataframe with selected input variables
    new_df <- reactive({
      College[, c(input$x_var, input$y_var)]
    })
    
    # run k-means with selected number of clusters
    k_clust <- reactive({
      kmeans(new_df(), input$num_clusters)
    })
    
    output$plot1 <- renderPlot({
      library(RColorBrewer)
      cols <- brewer.pal(12, "Paired")
      par(mar=c(5.1,4.1,4.1,2.1))
      plot(new_df(), col = cols[k_clust()$cluster], pch = 16, cex = 2)
    })
    
    
  }
  
  
  
)
  

  
 
