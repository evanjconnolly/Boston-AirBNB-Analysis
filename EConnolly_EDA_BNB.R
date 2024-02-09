library(pacman)
p_load(dplyr)
p_load(ggplot2)
p_load(VIM)
p_load(tidyverse)
p_load(reshape2)
p_load(gt)

listing_data <- read.csv("listings.csv")
review_data <- read.csv("reviews.csv")
calendar_data <- read.csv("calendar.csv")

calendar_data$price <- sub(".", "", calendar_data$price)
calendar_data$adjusted_price <- sub(".", "", calendar_data$adjusted_price)

calendar_data$date <- as.Date(calendar_data$date)
calendar_data$price <- as.integer(calendar_data$price)
calendar_data$adjusted_price <- as.integer(calendar_data$adjusted_price)
calendar_data <- calendar_data[complete.cases(calendar_data), ]

a <- aggr(bnb_data, plot = FALSE)
plot(a, numbers = TRUE, prop = FALSE)

nrow(listing_data)-nrow(unique(listing_data$id))
length(unique(listing_data$host_id))

date_price <- calendar_data[c(2,4)]

average_ppd <- aggregate(x=calendar_data[c("price")], FUN=mean, by=list(Group.date=calendar_data$date))
average_ppd$Group.date <- as.Date(average_ppd$Group.date) 
average_ppd <- filter(average_ppd, Group.date<"2023-09-15")

mean(average_ppd$price)


ggplot(filter(average_ppd))+
  geom_line(aes(x=Group.date, y=price))+
  ylab("Average Price Per Night")+ xlab("Date")+ labs(title = "Average Nightly Rate at a Boston AirBNB")+
  theme_grey()+
  scale_x_date(breaks = as.Date(c("2022-09-15", "2022-11-15", "2023-01-15", "2023-03-15", "2023-05-15", "2023-07-15", "2023-09-15")))+
  geom_vline(xintercept = as.Date("2023-04-18"), linewidth=1, color="darkblue")+
  geom_hline(yintercept = 212.08, linetype="dashed", color="red")+
  annotate("text", x=as.Date("2023-05-01"), y=235, label="Marathon Monday (2022)", angle=90, size=4, color="darkblue")+
  annotate("text", x=as.Date("2023-01-15"), y=210, label="Average Rate ($212.08)", size=4, color="red")

hosts <- listing_data[c(10:24)]
unique_host_count <- nrow(unique(select(hosts, c(host_id))))
nrow(hosts)-unique_host_count


multiple_unit_hosts <- 
  hosts %>%group_by(host_id) %>%
  mutate(n=length(host_id)) %>%
  ungroup(host_id) %>%
  filter(n >= 2) %>%
  arrange(desc(n)) %>%
  select(host_id, host_name, host_since, host_location, host_neighbourhood, n)

multiple_unit_hosts <- unique(multiple_unit_hosts)

multiple_unit_agreg_overten <- multiple_unit_hosts %>% 
  mutate(listed_units= ifelse(n>10, "10+", ifelse(n, n)))
  
  
  
multiple_unit_undertwenty <- filter(multiple_unit_hosts, n<=20)
multiple_unit_underten <- filter(multiple_unit_hosts, n<=10)


ggplot(multiple_unit_agreg_overten)+
  geom_bar(aes(x=factor(listed_units, level=c('1','2','3','4','5','6','7','8','9','10','10+')), fill=factor(listed_units)))+
  theme_grey()+
  scale_x_discrete(breaks=c(1:10, "10+"))+
  ylab("Host Count")+ xlab("Number of Units")+ labs(title = "Count of Multi-Unit Hosts by Number of Units")
  

