library(pscl)
library(dplyr)
presidentialElections

#cereal url
# https://perso.telecom-paristech.fr/eagan/class/igr204/data/cereal.csv

cereals <- read.csv('https://perso.telecom-paristech.fr/eagan/class/igr204/data/cereal.csv', sep = ';')[-1, ]
#do the sme thing but with chaining

sugar_vals_piped <- cereals %>%
                    select(name, sugars) %>%
                    mutate(num_sugars = as.numeric(sugars)) %>%
                    filter(num_sugars >= 0) %>%
                    arrange(-num_sugars, name)

summary_piped <- sugar_vals_piped %>%
                     summarize(avg_sugars = mean(num_sugars),
                     max_sugars = max(num_sugars),
                     min_sugars = min(num_sugars))

max_sugars <- pull(summary_piped, max_sugars)
min_sugars <- pull(summary_piped, min_sugars)

max_row_name_piped <- sugar_vals_piped  %>% 
                      filter(num_sugars == max(num_sugars)) %>%
                      pull(name)

min_row_name_piped <- sugar_vals_piped  %>% 
  filter(num_sugars == min(num_sugars)) %>%
  pull(name)

max_row_name <- max_row_name_piped

