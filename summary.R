library(shiny)
library(shinydashboard)

# Define UI for application
ui <- dashboardPage(
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

# Define server logic
server <- function(input, output) {}

# Run the application 
shinyApp(ui = ui, server = server)
