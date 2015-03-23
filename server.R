library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  aapl <- read.csv("aapl.csv")
  ge <- read.csv("ge.csv")
  sbux <- read.csv("sbux.csv")
  v <- read.csv("v.csv")
  gs <- read.csv("gs.csv")
  xom <- read.csv("xom.csv")
  fb <- read.csv("fb.csv")
  vz <- read.csv("vz.csv")
  ibm <- read.csv("ibm.csv")
  googl <- read.csv("googl.csv")
  aaplprice <- aapl$Close
  geprice <- ge$Close
  sbuxprice <- sbux$Close
  vprice <- v$Close
  gsprice <- gs$Close
  xomprice <- xom$Close
  fbprice <- fb$Close
  vzprice <- vz$Close
  ibmprice <- ibm$Close
  googlprice <- googl$Close
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should be automatically
  #     re-executed when inputs change
  #  2) Its output type is a plot
  
  output$distPlot <- renderPlot({
    x <- aaplprice
    x<-switch(input$data,
              "aaplprice"=aaplprice,
              "geprice"=geprice,
              "sbuxprice"=sbuxprice,
              "vprice"=vprice,
              "gsprice"=gsprice,
              "xomprice"=xomprice,
              "fbprice"=fbprice,
              "vzprice"=vzprice,
              "ibmprice"=ibmprice,
              "googlprice"=googlprice)
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'skyblue', border = 'white')
  })
  
})