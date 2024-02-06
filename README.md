# Final Project - Info 201
### Final Project Group 24
### Haochen Miao, Chris, Leo

#### Finding Data

Data Set #1: HBO Max | https://www.kaggle.com/datasets/dgoenrique/hbo-max-movies-and-tv-shows

We downloaded the data from Kaggle. Kaggle is a platform for data scientists to participate in competitions, access datasets, collaborate on projects, and utilize tools for data exploration, analysis, and modeling.

The data was collected from JustWatch in March 2023. JustWatch is a streaming search engine that provides information on where to watch movies and TV shows across various streaming platforms, including HBO Max. The dataset contains information about all the shows and movies available on HBO Max in the United States. It includes data on the titles, cast, and crew of each show or movie, as well as information on release year, age certification, runtime, genres, production countries, and scores from various sources such as IMDB and TMDB.

The 'titles.csv' file contains more than 3k titles, which means that it has more than 3,000 observations (rows). The file has 15 columns, which means that it has 15 features (columns).

The 'credits.csv' file contains over 64k credits of actors and directors, which means that it has over 64,000 observations (rows). The file has 5 columns, which means that it has 5 features (columns).

Dataset #2: Movie Dataset Rating | https://www.kaggle.com/datasets/ayushjain001/movie-dataset-rating

We downloaded this data from Kaggle as well.

Tthe data was collected by the author of the dataset from The Movie Database (TMDb) through their API, and converted into a CSV file for further use of the data. TMDb is a popular online database of information related to movies and TV shows, including their titles, release dates, plot summaries, ratings, and other details. The dataset contains information on top-rated movies, including the title, release date, overview, popularity, vote average, vote count, and video columns. It is not clear who originally collected the data on TMDb, but it is likely that the data was contributed by the TMDb community, which consists of users who submit and edit movie and TV show information on the site. The dataset can be used for data analytics, text analysis, and other purposes related to movies and entertainment.

The dataset contains 9462 observations (rows), which correspond to the top-rated movies according to the rating criterion used by the author of the dataset.

The dataset contains 9 features (columns), which include the movie's ID, title, release date, overview, popularity score, average rating score, number of user ratings, video flag, and an unnamed column.

###  Story Pitch

Our lives are shaped by our experiences and the stories we consume. From the birth of cinema in the 19th century to the present day, it has filled human life and holds tremendous power in influencing our emotions and perceptions of all aspects of life. These two datasets, which contain a wealth of information about movie titles, genres, countries of production and popularity ratings, offer a unique opportunity to explore this connection between movies and the most pervasive themes in our daily lives. We will provide a fresh perspective on how films reflect the human experience, transcend cultural boundaries, and resonate with millions of people around the world. This compelling exploration will not only reveal the impact of film on our lives, but will also illuminate the universality of human emotion and experience.

In this fascinating data-driven story, we will delve into the world of film, using the two datasets selected to reveal the relationship between these fundamental life issues and their cinematic representation. We will examine the prevalence of each theme across genres and analyze how different producing countries address these themes in their films and, by delving further, analyze the interplay between the values of each country's population and its films. In addition, we will examine the popularity of the film and its relationship to these themes by analyzing IMDb and TMDB scores and polls, and thus explore economic and professional trends in the film industry.

Films embodies a captivating tapestry of intrigue and wonder, weaving stories that seamlessly traverse the spectrum from simplicity to profound depth. This exploration will ignite readers' curiosity, inspiring them to delve into the rich, immersive realms of their own inner landscapes, and prompt them to consider how it has shaped their lives.

#### Research / Inspiration 
https://data-flair.training/blogs/data-science-r-movie-recommendation/
* Compare: both the proposed project and the inspiration article foucs on the analysis of movie datasets to uncover patterns and insights into the film industry and its impact on human lives. Also these projects both aim to provide valuable insights into movie preferences, trends, and correlations with cultural values, thus forstering a deeper understanding of how films reflect and influence our lives.
* Contrast: The proposed project aims to explore the relationship between fundamental life issues and their cinematic representation, whereas the inspiration aritcle is focused on building a movie recommendation system based on user preferences. While the inspiration article primarily focuses on implementing a recommendation system using machine learning algorithms, our project will analyze the prevalence of themes across genres and countries, examine the connection between a film's popularity and its themes, and explore economic and professional trends in the film industry.

https://www.kaggle.com/code/ibtesama/getting-started-with-a-movie-recommendation-system/notebook
* Compare: Both the proposed project and the inspiration article tilize movie datasets to gain insights into the film industry and its impact on viewers, aiming to enhance the user experience. Also both of projects involve analyzing movie titles, genres, and other relevant information to uncover patterns, preferences, and trends in the movie industry.
* Contrast: The proposed project focused more explorying the relationship between fundamental life issues and their cienematic representation, as well as the connection between a film's popularity and its themes, while the inspiration article is primarily concerned with building a movie recommendation system based on content and collaborative filtering. While our project delves into the prevalence of themes across genres and countries, examning the interplay between a country's values and its films, whereas the inspiration article emphasizes the implementaiton of recommendation algorithms to suggest movies to users based on their preferences and similarities with other users.



https://www.analyticsvidhya.com/blog/2016/06/quick-guide-build-recommendation-engine-python/
* Compare: Both the proposed project and the inspiration article work with movie datasets to extract insights and understand patterns within the film industry. Also both projects involve analyzing movie-related information such as titles, genres, and other metadata to draw conclusions about viewer preferences and industry trends.
* Contrast: The proposed project aims to explore the relationship between fundamental life issues and their cinematic representation, along with examining the connection between a film's popularity and its themes, whereas the inspiration article focuses on building a simple movie recommendation system using Python. While our project investigates the prevalence of themes across genres and countries and delves into the relationship between a country's values and its films, while the inspiration article centers on the implementation of a recommendation engine using a similarity metric to recommend movies to users based on their past ratings and preferences.

https://towardsdatascience.com/how-to-build-a-movie-recommendation-system-67e321339109
* Compare: Both the proposed project and the inspiration article are centered around movie datasets, seeking to uncover insights and patterns related to the film industry.Also both projects involve the analysis of movie metadata such as titles, genres, and other information to better understand viewer preferences and industry trends.
* Contrast: The proposed project focuses on exploring the relationship between fundamental life issues and their cinematic representation, as well as examining the connection between a film's popularity and its themes, while the inspiration article is dedicated to building a movie recommendation system using collaborative filtering. While our project delves into the prevalence of themes across genres and countries, and investigates the interplay between a country's values and its films, whereas the inspiration article is primarily concerned with implementing a recommendation system that suggests movies to users based on their past ratings and the preferences of similar users.

https://www.analyticsvidhya.com/blog/2020/11/create-your-own-movie-movie-recommendation-system/
* Compare:  Both the proposed project and the inspiration article work with movie datasets to analyze patterns and derive insights related to the film industry. also both projects involve examining movie metadata such as titles, genres, and other relevant information to understand viewer preferences and uncover industry trends.
* Contrast: The proposed project aims to explore the relationship between fundamental life issues and their cinematic representation, as well as investigate the connection between a film's popularity and its themes, while the inspiration article focuses on building a movie recommendation system using content-based filtering. While our project delves into the prevalence of themes across genres and countries, and studies the relationship between a country's values and its films, whereas the inspiration article concentrates on implementing a recommendation system that suggests movies to users based on their past preferences and the similarity of movie content.


