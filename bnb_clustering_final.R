library(pacman)
p_load(tidyverse, gt, glue, rpart, caret, rpart.plot, rattle, readxl, fpc, factoextra, randomForest, lubridate, cluster, DescTools, ggfortify)

listing_data <- read.csv("AirBNB_Listings_Group.csv", na.strings = c("", "NA", "N/A"))
listing_data$price <- sub(".", "", listing_data$price)
listing_data$price <- as.numeric(listing_data$price)

listing_data_units <- listing_data %>% select("host_response_rate", "host_acceptance_rate", "host_listings_count", "accommodates", "bedrooms", "beds", "price", "host_is_superhost")
listing_data_units$host_response_rate <- as.numeric(gsub("%$", "", listing_data_units$host_response_rate))
listing_data_units$host_is_superhost <- ifelse(listing_data_units$host_is_superhost=="t", 1,0)
listing_data_units$host_acceptance_rate <- as.numeric(gsub("%$", "", listing_data_units$host_acceptance_rate))
str(listing_data_units)

listing_data_units <- listing_data_units[complete.cases(listing_data_units), ]
listing_data_units_scale <- scale(listing_data_units)

fviz_nbclust(listing_data_units_scale, kmeans, method = "wss") + labs(subtitle = "Elbow Method")
fviz_nbclust(listing_data_units_scale, kmeans, method = "silhouette") + labs(subtitle = "Silouette Method")

unit_k_model <- kmeans(listing_data_units, centers=5)
fviz_cluster(unit_k_model, listing_data_units, geom= "point")

unit_k_model$tot.withinss

unit_k_model$betweenss/unit_k_model$totss
gt(aggregate(listing_data_units, by=list(cluster=unit_k_model$cluster), mean))
listing_data_with_clust <- cbind(listing_data_units, cluster=unit_k_model$cluster)

full_listing_with_clust <- merge(listing_data_with_clust, listing_data, by=0)
