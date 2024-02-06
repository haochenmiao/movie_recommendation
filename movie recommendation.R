# Name: Haochen Miao, Chris and Leo
# Final Project: Movie Recommendations
# Date: 5/6/2023
#
# Install libraries
library(dplyr)
library(stringr)
library(testthat)

# Load Data

df_1 <- read.csv("titles.csv")
df_2 <- read.csv("credits.csv")
df_3 <- read.csv("Movie-Dataset-Latest.csv")

titles <- df_1
credits <- df_2
movie_latest <- df_3

# join the data
merged_data <- merge(titles, credits, by = "id")
unified_data <- merge(merged_data, movie_latest, by = "title")
unified_data <- unified_data[c("id.x", "title", "release_date", "overview", 
                               "popularity", "vote_average", "vote_count", 
                               "video", "type", "description", "release_year", 
                               "age_certification", "runtime", "genres", 
                               "production_countries", "seasons", "imdb_id", 
                               "imdb_score", "imdb_votes", "tmdb_popularity", 
                               "tmdb_score", "person_id", "name", "character", 
                               "role", "X")]
colnames(unified_data)[1] <- "id"


#create new categorical variable if the movie is action
unified_data$new_genre <- ifelse(grepl("action|adventure", unified_data$genres, 
                                       ignore.case = TRUE), "Action/Adventure",
                                 ifelse(grepl("comedy|romance", unified_data$genres, 
                                              ignore.case = TRUE), "Comedy/Romance", 
                                        ifelse(grepl("drama", unified_data$genres, 
                                                     ignore.case = TRUE), "Drama","Other")))
# Create new continuous/numerical variable
unified_data$total_rating <- unified_data$imdb_score + unified_data$tmdb_score

# Create summarization data frame
genre_groups <- split(unified_data, unified_data$new_genre)

genre_summary <- data.frame()

for (genre in names(genre_groups)) {
  genre_df <- genre_groups[[genre]]
  num_movies <- nrow(genre_df)
  avg_popularity <- mean(genre_df$popularity)
  avg_rating <- mean(genre_df$total_rating)
  summary_row <- data.frame(new_genre = genre, 
                            avg_popularity = avg_popularity, 
                            avg_rating = avg_rating, 
                            num_movies = num_movies)
  genre_summary <- rbind(genre_summary, summary_row)
}

# Order by average popularity
genre_summary <- genre_summary[order(-genre_summary$avg_popularity),]

# Print summarization data frame
print(genre_summary)

# Filter the data to only include movies released after 2000
unified_data <- unified_data[unified_data$release_year > 1980,]

# Randomly sample 25,000 rows from the filtered data
unified_data <- unified_data[sample(nrow(unified_data), 25000),]



write.csv(unified_data, file = "unified_data.csv", row.names = FALSE)


