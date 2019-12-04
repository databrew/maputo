library(tidyverse)
library(rio)
salaries <- rio::import("https://github.com/databrew/maputo/raw/master/data/salaries.rds")

# 3. Make a distribution plot of the salaries.
ggplot(data = salaries, aes(x = salary)) +
  geom_density()

# 4. Facet the distribution by sex (use facet_wrap).
ggplot(data = salaries, aes(x = salary)) +
  geom_density() +
  facet_wrap(~sex)

# 5. Facet the distribution by sex and rank (use  facet_grid).

ggplot(data = salaries, aes(x = salary)) +
  geom_density() +
  facet_grid(sex~rank)

#6. Facet the distribution by sex and rank (use  facet_grid) and fill the chart according to  discipline

ggplot(data = salaries, aes(x = salary, fill = discipline)) +
  geom_density() +
  facet_grid(sex~rank)

# 7. Create a scatterplot of years of service and salary.

ggplot(data = salaries,
       aes(x = yrs_service,
           y = salary)) +
  geom_point()

# 8. Color the points in the above by sex.

 

# 9. Make the size of the points in the above a reflection of years since PhD
ggplot(data = salaries,
       aes(x = yrs_service,
           y = salary,
           color = sex,
           size = yrs_since_phd)) +
  geom_point(alpha = 0.3)

# 10. Facet the above by rank.
ggplot(data = salaries,
       aes(x = yrs_service,
           y = salary,
           color = sex,
           size = yrs_since_phd)) +
  geom_point(alpha = 0.3) +
  facet_wrap(~rank)

# 11. Facet the above by both rank and discipline.
ggplot(data = salaries,
       aes(x = yrs_service,
           y = salary,
           color = sex,
           size = yrs_since_phd)) +
  geom_point(alpha = 0.3) +
  facet_grid(rank~discipline)

# Create an object called x. This will be have the average salary for professors by rank, discipline, and sex.

x = salaries %>%
  group_by(discipline, rank, sex) %>%
  summarise(avg_salary = mean(salary))

# 13. Make a plot of x (however you would like).

databrew.cc/exercises3
(click on "violence")








  
