library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Reactivity"),
  
  # Sidebar with controls to provide a caption, select a dataset,
  # and specify the number of observations to view. Note that
  # changes made to the caption in the textInput control are
  # updated in the output area immediately as you type
  sidebarLayout(
    sidebarPanel(
      selectInput("year", "Year", choice = c("2004", "2005")),
      
      selectInput("commodity", "Choose a commodity:", 
                  choices = c("Wheat", "Barley")),
      
      selectInput("month", "month of interest.  Use a number (1-12)", choices = c("1", "2"))
    ),
    
    
    # Show the caption, a summary of the dataset and an HTML 
	 # table with the requested number of observations
	 mainPanel(plotOutput("plot"))
  )
))
