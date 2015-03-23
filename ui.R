library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Hello World!"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      radioButtons("data", "Stock:",
                   c("Apple" = "aaplprice",
                     "General Electric" = "geprice",
                     "Starbucks" = "sbuxprice",
                     "Visa" = "vprice",
                     "Goldman Sachs" = "gsprice",
                     "Exxon Mobil" = "xomprice",
                     "Facebook" = "fbprice",
                     "Verizon"= "vzprice",
                     "IBM" = "ibmprice",
                     "Google" = "googlprice")),
      sliderInput("bins",
                  "Number of bins:",
                  min = 5,
                  max = 50,
                  value = 30)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))