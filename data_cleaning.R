library(tidyverse)
# Carregar o pacote necessário
library(read.dbc)

# Criar vetores com os anos de interesse
years_sifilis <- 13:23  # Anos para sífilis
years_hepatite <- 13:22  # Anos para hepatite

# Inicializar listas vazias para armazenar os dados
sifilis_list <- list()
hepatite_list <- list()

# Loop para ler os arquivos .dbc de sífilis (SIFABR)
for (year in years_sifilis) {
  sifilis_file <- sprintf("D:/OneDrive - Insper - Instituto de Ensino e Pesquisa/Estudos/Insper/DataSUS/SINAN-SIFA/SIFABR%02d.dbc", year)
  
  if (file.exists(sifilis_file)) {
    sifilis_list[[as.character(year)]] <- read.dbc(sifilis_file)
  } else {
    message(sprintf("Arquivo de sífilis para o ano %02d não encontrado.", year))
  }
}

# Loop para ler os arquivos .dbc de hepatite (HEPABR)
for (year in years_hepatite) {
  hepatite_file <- sprintf("D:/OneDrive - Insper - Instituto de Ensino e Pesquisa/Estudos/Insper/DataSUS/SINAN-HEPA/HEPABR%02d.dbc", year)
  
  if (file.exists(hepatite_file)) {
    hepatite_list[[as.character(year)]] <- read.dbc(hepatite_file)
  } else {
    message(sprintf("Arquivo de hepatite para o ano %02d não encontrado.", year))
  }
}

# Combinar as bases de dados separadamente
sifilis <- do.call(rbind, sifilis_list)  # Base de sífilis
hepatite <- do.call(rbind, hepatite_list)  # Base de hepatite

