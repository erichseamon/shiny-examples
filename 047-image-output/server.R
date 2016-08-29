library(png) # For writePNG function

shinyServer(function(input, output, session) {


  # image2 sends pre-rendered images
  output$image2 <- renderImage({
    if (is.null(input$picture))
      return(NULL)

    if (input$picture == "Agriculture and Food Resilience") {
      return(list(
        src = "images/face.png",
        contentType = "image/png",
        alt = "Face"
      ))
    } else if (input$picture == "Ecosystem Vulnerability") {
      return(list(
        src = "images/chainring.jpg",
        filetype = "image/jpeg",
        alt = "This is a chainring"
      ))
    }

  }, deleteFile = FALSE)
})


