# Instale os pacotes necessários (se ainda não os tiver instalado)
install.packages(c("tm", "wordcloud")) 

# Carregue os pacotes
library(tm)
library(wordcloud)

# Substitua pelo caminho real do seu arquivo TXT
caminho_arquivo <- "C:/Users/ifbad/Desktop/transcricao/transcricaoFormatada.txt" 

# Carregue o texto do arquivo TXT
meu_texto <- readLines(caminho_arquivo, encoding = "UTF-8")

# Crie um corpus
meu_corpus <- Corpus(VectorSource(meu_texto))

# Limpeza e pré-processamento do texto
meu_corpus <- tm_map(meu_corpus, content_transformer(tolower)) # Minúsculas
meu_corpus <- tm_map(meu_corpus, removePunctuation)   # Pontuação
meu_corpus <- tm_map(meu_corpus, removeNumbers)      # Números
meu_corpus <- tm_map(meu_corpus, removeWords, stopwords("portuguese")) # Stopwords
meu_corpus <- tm_map(meu_corpus, stripWhitespace)     # Espaços em branco

# Crie a nuvem de palavras
wordcloud(meu_corpus, 
          max.words = 100, # Máximo de palavras na nuvem
          random.order = FALSE, # Palavras em ordem decrescente de frequência
          colors = brewer.pal(8, "Dark2")) # Paleta de cores