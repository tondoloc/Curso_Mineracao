# DM_03_03.R

# CARREGAR DADOS ###########################################
#carros gelatina, familia real, dimensoes de personalidade, estados, regioes
# Ler CSV
states <- read.csv("~/Documentos/Mineração/arquivos_de_exercicios_ciencia_dados_fundamentos_mineracao/Cap.3/03_03/ClusterData.csv", header = T)
colnames(states)

# Salvar apenas dados numéricos sem nomes de estadoe e outros
st <- states[, 3:27]
row.names(st) <- states[, 2]
colnames(st)

# Apenas dados de pesquisas sobre esportes
sports <- st[, 8:11]
head(sports)

# AGRUPAMENTO ##############################################

# Criar matriz de distâncias 
d <- dist(st)
# calcula a distancia entre todos os casos e está usando distancia euclidiana

# Agrupamento hierárquico
c <- hclust(d)
c # Informações sobre o agrupamento

# Gerar dendrograma dos agrupamentos
plot(c, main = "Cluster with All Searches and Personality")

# Ou aninhar comandos em uma linha (para dados esportivos)
plot(hclust(dist(sports)), main = "Sports Searches")

# LIMPAR ###################################################

# Limpar espaço de trabalho
rm(list = ls()) 

# Limpar gráficos
dev.off()

# Limpar console
cat("\014")  # CTRL+L
