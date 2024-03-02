library(aRxiv)
library(gender)
library(tidyverse)
library(stringr)
library(openai)

# search for a term on this database of scientific articles
llms <- arxiv_search('Large Language Models', limit=100)

# let's browse the author's names
# print(llms$authors)

llms <- llms %>%
  mutate(firstName=word(authors, 1))

genders <- gender(llms$firstName)
print(table(genders$gender))

# llms detecting gender?

# authenticate yourself with OpenAI using your credentials
Sys.setenv(
  OPENAI_API_KEY = ''
)

open_ai_output <- create_chat_completion(
  model = "gpt-3.5-turbo",
  messages = list(
    list(
      "role" = "user",
      "content" = "What is the theory of structural holes?"
    )
  )
)
