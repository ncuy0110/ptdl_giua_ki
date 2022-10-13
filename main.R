# read data set
d <- read.csv("film_dataset.csv")

# show all field name in data set
colnames(d)

#
summary(d)

# show number of row
nrow(d)
ncol(d)

# remove na rows
d <- as.data.frame(apply(d, 2, function(x) gsub("\\s+", "", x)))
d[d == ""] <- NA
tail(d)
d <- na.omit(d)
tail(d)

nrow(d)

# find top 10 films by average vote
d2 <- head(d[order(d$avg_vote, decreasing = TRUE),], 10)
d2[c(2, 9)]

# find top 10 films by duration
head(d[order(d$duration, decreasing = TRUE),], 10)[c(2, 5)]
head(d[order(d$duration),], 10)[c(2, 5)]

# find top 10 genre by vote
l_avg <- aggregate(d$total_votes, list(d$genre), FUN=mean)
rs <- head(l_avg[order(l_avg$x, decreasing = TRUE),], 10)
rs
barplot(rs$x, names.arg = rs$Group.1, col = "red")

# country
df2 <- aggregate(d$avg_vote, by=list(d$country), FUN=length)
head(df2[order(df2$x, decreasing = TRUE),], 5)

# vote > 8.0
d[d$avg_vote >= 8.1, c(1, 2, 9)]

