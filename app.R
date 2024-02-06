library(tidyverse)
library(shiny)
library(ggplot2)
library(DT)
library(treemap)
library(dplyr)
library(lubridate)
library(shinydashboard)

data <- read.csv("unified_data.csv")

  # Define UI for the application
  ui <- fluidPage(
    titlePanel("Movie Recommendation Analysis"),
    
    tabsetPanel(
      
      tabPanel("Welcome to the World of Movies Analysis",
               sidebarLayout(
                 sidebarPanel(
                   width = 4,
                   tags$img(src = "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fblog.assets.triviagenius.com%2F2019%2F06%2FMovie-generic.jpg&f=1&nofb=1&ipt=4599565935920929b0f533f39f85c20e8d83edd058c05862ef04fe2e020090ba&ipo=images&auto=format&fit=crop&w=1567&q=80", 
                            height = 300, width = "100%"),
                   h2("About The Project"),
                   p("In this era of streaming services, we've all faced the paradox of choice when picking a movie to watch. With vast amounts of content at our fingertips, it's intriguing to explore what makes a movie popular or critically acclaimed. It's also intriguing to know which films defy the norm and why some movies unexpectedly resonate with the audiences or critics.

In this project, we aim to provide an in-depth analysis of these movie phenomena and give you an interactive platform to navigate through various aspects of the movie universe."),
                   h2("Why This Matters"),
                   p("Understanding the dynamic nature of movie popularity and ratings, as well as the factors contributing to unexpected hits or misses, can offer valuable insights for filmmakers, marketers, and even movie enthusiasts.

For filmmakers, it can guide decision-making regarding script selection, casting, and budget allocation. For marketers, it can assist in tailoring successful promotion strategies. For movie lovers, it can provide an exciting opportunity to explore the intriguing patterns and outliers in the world of cinema."),
                   h2("Our Data"),
                   p("We've gathered a comprehensive dataset that includes a wide array of movies available on HBO Max, as well as a rich compilation of data points from various other movie databases like IMDB. Our dataset includes information about movie genres, directors, audience ratings, and critical reviews, among other things.

We've cleaned and curated this data to ensure its reliability and to facilitate accurate, insightful analysis."),
                 ),
                 # Main panel with analyses and image
                 mainPanel(
                   width = 8,
                   h2("Our Analyses"),
                   p("We have three primary areas of analysis in this project:"),
                   tags$ol(
                     tags$li(
                       strong("World of Movies: The Deep Dive into HBO Max"),
                       p("Get an in-depth analysis of the wide array of content available on HBO Max, from genre distribution to top-rated movies and shows.")),
                     tags$li(
                       strong("Outliers in the Movie Universe: Unexpected Hits and Misses"),
                       p("Uncover the surprises and the disappointments of the movie world. We analyze movies that exceeded expectations or fell short, despite indicators suggesting otherwise.")),
                     tags$li(
                       strong("The Changing of Movie Popularity and Ratings Over Time"),
                       p("Discover the evolution of movie popularity and ratings over the years and the factors contributing to these changes.")
                     )
                   ),
                   tags$img(src = "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.listchallenges.com%2Ff%2Flists%2Fe79a9ac6-5777-485a-a476-b0a2f983e2f0.jpg&f=1&nofb=1&ipt=8b77d6b6285e04996f643eda99b981f5f590c025885d10c69386792c0c7d5628&ipo=images&auto=format&fit=crop&w=1567&q=80", 
                            height = 600, width = "100%")
                 )
               )
      ),
      
      
      
      tabPanel("World of Movies: The Deep Dive into HBO Max", 
               tabsetPanel(
                 tabPanel("Genre Distribution", plotOutput("genreTreemap")),
                 tabPanel("Top Rated Movies", plotOutput("topRatedMovies")),
                 tabPanel("Rating Distribution", plotOutput("ratingHistogram"))
               )
      ),
      tabPanel("Outliers in the Movie Universe: Unexpected Hits and Misses", 
               sidebarLayout(
                 sidebarPanel(
                   selectInput("var", 
                               label = "Select a variable to compare with total rating:",
                               choices = c("Release Year" = "release_year", "Popularity" = "popularity", "Movie vs. Tv Show" = "type", 
                                           "Age Rating" = "age_certification", "Runtime" = "runtime", "Genre" = "new_genre"),
                               selected = "Popularity"
                   )
                 ),
                 mainPanel(
                   plotOutput("scatterPlot"),
                   DT::dataTableOutput("mytable"),
                   br(),
                   h3("Outliers Detail"),
                   DT::dataTableOutput("outlierTable")
                 )
               )
      ),
      tabPanel("The Evolution of Movies Popularity",
               sidebarLayout(
                 sidebarPanel(
                   helpText("Explore how movies' popularity have evolved over time."),
                   sliderInput("years", "Choose a range of years:", min = min(data$release_year, na.rm = TRUE), max = max(data$release_year, na.rm = TRUE), value = c(1940, 2020))
                 ),
                 mainPanel(
                   textOutput("context"),
                   plotOutput("popularityPlot"),
                   plotOutput("votingAveragePlot"),
                   tableOutput("movieTable")
                 )
               )
      ),
      tabPanel("Summary Takeaways & About Page",
               dashboardPage(
                 dashboardHeader(title = "Summary Takeaways & About Page"),
                 dashboardSidebar(
                   sidebarMenu(
                     menuItem("Summary Takeaways", tabName = "takeaways", icon = icon("book")),
                     menuItem("About", tabName = "about", icon = icon("info-circle"))
                   )
                 ),
                 dashboardBody(
                   tabItems(
                     # Summary takeaways
                     tabItem(tabName = "takeaways",
                             h2("Summary Takeaways"),
                             fluidRow(
                               box(width = 6,
                                   title = "World of Movies: The Deep Dive into HBO Max",
                                   status = "primary", solidHeader = TRUE,
                                   p("Through our analysis of HBO Max's extensive movie catalog, we discovered that the most popular genres on the platform are Action, Comedy, and Drama. Additionally, the top-rated movies and shows are a mix of classic favorites and new releases."),
                                   p("Why should you care? Understanding the genre preferences and top-rated content on HBO Max can help you make informed choices when selecting movies to watch on the platform.")
                               ),
                               box(width = 6,
                                   title = "Outliers in the Movie Universe: Unexpected Hits and Misses",
                                   status = "primary", solidHeader = TRUE,
                                   p("In our analysis of unexpected hits and misses, we found that several movies exceeded expectations despite low budgets and minimal marketing. On the other hand, some highly anticipated films failed to resonate with audiences despite significant investments."),
                                   p("Why should you care? Exploring these outliers can provide valuable insights for filmmakers and marketers, enabling them to understand the unpredictable nature of movie success and make strategic decisions for future projects.")
                               ),
                               box(width = 6,
                                   title = "The Changing of Movie Popularity and Ratings Over Time",
                                   status = "primary", solidHeader = TRUE,
                                   p("By analyzing movie popularity and ratings over the years, we observed a shift in audience preferences, with an increasing interest in independent films and a decline in certain mainstream genres. We also found that the rise of streaming platforms has influenced the way movies are consumed and rated."),
                                   p("Why should you care? Understanding the evolving landscape of movie popularity and ratings can help filmmakers, distributors, and content creators adapt their strategies to meet the changing demands of audiences and stay ahead of industry trends.")
                               )
                             )
                     ),
                     # About page
                     tabItem(tabName = "about",
                             h2("About"),
                             box(
                               title = "About this Project", status = "info", solidHeader = TRUE,
                               p("This project was conducted by Leo Minichillo, Haochen Miao, and Chris Yu."),
                               p("We obtained our dataset from two sources, Data Set #1: HBO Max | https://www.kaggle.com/datasets/dgoenrique/hbo-max-movies-and-tv-shows | Dataset #2: Movie Dataset Rating | https://www.kaggle.com/datasets/ayushjain001/movie-dataset-rating"),
                               p("Our aim with this project was to provide insightful analyses and uncover intriguing patterns in the world of movies. By understanding these patterns, we hope to contribute to the industry's understanding of movie success and provide valuable insights for filmmakers, marketers, and movie enthusiasts.")
                             )
                     )
                   )
                 )
               )
      )
    )
  )
  
  
  server <- function(input, output) {
    
    # Extract genres
    genres <- strsplit(as.character(data$genres), split = "', '", fixed = TRUE)
    
    # Unlist and remove brackets
    genres <- gsub("\\[|\\]|'", "", unlist(genres))
    
    # Create data frame
    genres_df <- data.frame(genre = genres)
    
    # Count genres
    genre_counts <- table(genres_df$genre)
    genre_counts <- data.frame(genre = names(genre_counts), count = as.numeric(genre_counts))
    
    data$total_rating <- replace_na(data$total_rating, 0)
    
    
    # Remove duplicate titles and select top 10 highest-rated movies
    data <- data[!duplicated(data$title), ]
    
    top_rated_movies <- data[order(-data$total_rating), ][1:10, ]
    
    # Check if there are any movies in top_rated_movies
    if (nrow(top_rated_movies) == 0) {
      stop("No movies found or all ratings are NA")
    }
    
    # Output: Treemap of genres
    output$genreTreemap <- renderPlot({
      # Create treemap
      treemap(genre_counts,
              index = "genre",
              vSize = "count",
              title = "Distribution of Genres on HBO Max",
              palette = "Dark2")
    })
    
    # Output: Bar chart of top-rated movies
    output$topRatedMovies <- renderPlot({
      top_rated_movies$title <- reorder(top_rated_movies$title, top_rated_movies$total_rating)
      ggplot(top_rated_movies, aes(x = title, y = total_rating)) +
        geom_bar(stat = "identity", fill = "steelblue") +
        coord_flip() +
        labs(title = "Top 10 Highest-Rated Movies on HBO Max",
             x = "Movie",
             y = "Average Rating")
    })
    
    # Output: Histogram of viewer ratings
    output$ratingHistogram <- renderPlot({
      # Remove NA ratings
      valid_ratings <- data$total_rating[!is.na(data$total_rating)]
      
      # Create histogram
      ggplot(data.frame(rating = valid_ratings), aes(x = rating)) +
        geom_histogram(binwidth = 0.5, fill = "steelblue", color = "white") +
        labs(title = "Distribution of Viewer Ratings on HBO Max",
             x = "Rating",
             y = "Count")
    })
    
    # Create a reactive scatter plot
    output$scatterPlot <- renderPlot({
      g <- ggplot(data, aes(!!sym(input$var), total_rating)) + 
        geom_point() +
        geom_smooth(method = lm)
      g
    })
    
    
    # Create a reactive table showing outliers
    output$outlierTable <- DT::renderDataTable({
      selectedVar <- data[[input$var]]
      lowerq <- quantile(selectedVar, 0.25)
      upperq <- quantile(selectedVar, 0.75)
      iqr <- upperq - lowerq
      outliers <- (selectedVar < (lowerq - 1.5 * iqr)) | (selectedVar > (upperq + 1.5 * iqr))
      outlierData <- data[outliers, ]
      DT::datatable(outlierData)
    })
    
    # Filter data based on user's choices
    filtered_data <- reactive({
      data %>%
        filter(!is.na(release_year)) %>%
        filter(release_year >= input$years[1],
               release_year <= input$years[2])
    })
    
    # Provide some context based on user's choices
    output$context <- renderText({
      paste("You have selected movies from", input$years[1], "to", input$years[2], ".")
    })
    
    # Plot average movie popularity over time
    output$popularityPlot <- renderPlot({
      ggplot(filtered_data(), aes(x = release_year, y = tmdb_popularity)) +
        geom_line() +
        labs(title = "Average movie popularity over time", x = "Year", y = "Popularity")
    })
  }
  
  # Run the application 
  shinyApp(ui = ui, server = server)