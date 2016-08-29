library(shiny)
library(datasets)

# Define server logic required to summarize and view the 
# selected dataset
pantrap07 <- read.csv("pantrap07_refined.csv")
pantrap08 <- read.csv("pantrap08_refined.csv")
pantrap09 <- read.csv("pantrap09_refined.csv")
pantrap11 <- read.csv("pantrap11_refined.csv")
pantrap12 <- read.csv("pantrap12_refined.csv")


shinyServer(function(input, output) {
  
  # Return the requested dataset
  datasetInput <- reactive({
    switch(input$dataset,
           "Pan Traps 2007" = pantrap07,
           "Pan Traps 2008" = pantrap08,
           "Pan Traps 2009" = pantrap09,
	         "Pan Traps 2011" = pantrap11,
	         "Pan Traps 2012" = pantrap12)
  })

  dateInput <- reactive({
    switch(input$date,
           "X5_14_07" = May707,
           "X5_17_07" = May1707)
    
    
    
  })
  

  
  
  # Fill in the spot we created for a plot

  output$aphidPlot <- renderPlot({
    d = datasetInput()
    date = dateInput()
    W <- ripras(d)
    dat1 <- as.ppp(d,W=W)
    kc <- Kest(dat1)
    plot(kc)
    
})
  output$aphidPlot2 <- renderPlot({
    d = datasetInput()
    barplot(height=d[,15],names.arg=d[,15])
    #barplot(height=as.matrix(d[4:19]), main="All data grouped by time, 2007", ylab="Total", beside=TRUE, col=terrain.colors(20))
})      


  # Generate a summary of the dataset
  output$summary <- renderPrint({
    dataset <- datasetInput()
    summary(dataset)
  })
  
  # Show the first "n" observations
  output$view <- renderTable({
    head(datasetInput(), n = input$obs)
  })
  
})
  
