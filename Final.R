library(shiny)
library(ggplot2)
library(dplyr)
library(lubridate)  

movie_data <- read.csv("unified_data.csv")
movie_data$year <- as.numeric(year(ymd(movie_data$release_date)))

ui <- fluidPage(
  titlePanel("The Evolution of Movies Popularity"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Explore how movies' popularity have evolved over time."),
      
      sliderInput("years", "Choose a range of years:", min = min(movie_data$year, na.rm = TRUE), max = max(movie_data$year, na.rm = TRUE), value = c(1940, 2020))
    ),
    
    mainPanel(
      textOutput("context"),
      plotOutput("popularityPlot"),
      plotOutput("votingAveragePlot"),
      tableOutput("movieTable")
    )
  )
)

server <- function(input, output) {
  
  # Filter data based on user's choices
  filtered_data <- reactive({
    movie_data %>%
      filter(!is.na(year)) %>%
      filter(year >= input$years[1],
             year <= input$years[2])
  })
  
  # Provide some context based on user's choices
  output$context <- renderText({
    paste("You have selected movies from", input$years[1], "to", input$years[2], ".")
  })
  
  # Plot average movie popularity over time
  output$popularityPlot <- renderPlot({
    ggplot(filtered_data(), aes(x = year, y = popularity)) +
      geom_line() +
      labs(title = "Average movie popularity over time", x = "Year", y = "Popularity")
  })
}

shinyApp(ui = ui, server = server)
