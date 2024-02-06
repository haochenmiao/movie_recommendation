library(shiny)

# Define UI for application
ui <- fluidPage(
  
  # App title
  titlePanel("Welcome to the World of Movies Analysis"),
  
  # Sidebar with information about the project
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
)
# Define server logic
server <- function(input, output) {}

# Run the application 
shinyApp(ui = ui, server = server)
