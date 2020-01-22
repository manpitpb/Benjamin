library(tidyverse)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

fliter(mpg, cyl = 8)
filter(diamond, carat > 3)

# From this I learn how ggplot works in the function that it first calls the data set, then it calls the different aesetics which in this car are displ for the x axis and hwy for the y axis. It then goes on to use filters the mpg groups to those of 6 cylinders. This would seperate into the different groups.


library(tidyverse)
dat <- read_csv("https://byuistats.github.io/M335/data/rcw.csv",
                col_types = cols(Semester_Date = col_date(format = "%m/%d/%y"),
                                 Semester = col_factor(levels = c("Winter", "Spring", "Fall"))))


ggplot(dat, aes(x = Department, y = Count, fill = factor(Year))) + geom_col(position = "dodge")

dat %>% ggplot(aes(x = Semester_Date, y = Count, color = Department)) + geom_point() + geom_line() + labs(title = "RCW Participation Over Time", x = "Semester Date", y = " Number of Participants") + theme_classic()



#dat %>%  group_by(Year, Department) %>%  summarise(Total = sum(Count), mean = mean(Count), sd = sd(Count)) %>% ungroup() %>%
dat %>%   ggplot(aes(x = Department, y = Count, fill = factor(Semester_Date))) + geom_col(position = "Dodge") + facet_grid(Semester ~ Year) 

dat %>%  ggplot(aes(x = Semester_Date, y = Count, color = Department)) + geom_line() + theme_bw 

