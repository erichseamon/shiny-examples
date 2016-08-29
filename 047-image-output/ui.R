shinyUI(fluidPage(
  titlePanel("DMINE Climate Dashboard Analytics rev.1.1"),

  fluidRow(
    column(4, wellPanel(
      radioButtons("picture", "Climate Impact Areas",
                  c("Agriculture and Food Resilience", "Ecosystem Vulnerability"))

    )),
    column(4,
      imageOutput("image1", height = 300),
      imageOutput("image2")
    )
  )
))
