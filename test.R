library(tidyverse)
library(dslabs)
data(murders)

mrate <- murders %>% mutate(region = factor(region), rate = total / population*10^5) %>%
  mutate(abb = reorder(abb, rate))
mrate %>%
  ggplot(aes(abb, rate)) +
  geom_bar(width = 0.5, stat = "identity", color = "black") +
  coord_flip()

getwd() #aktuelles Verzeichnis 
save(mrate, file = "rda/mrate.rda")
ggsave("figs/barplot.png")

summary(mrate)
