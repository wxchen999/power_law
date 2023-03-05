library(readxl)
library(openxlsx)
data1 <- read_excel('/Users/chenweixun/Desktop/0902_meeting/元大50_2020829-20210828.xlsx')
data2 <- read_excel('/Users/chenweixun/Desktop/0902_meeting/元大50_20210829-20220829.xlsx')
stock50 <- rbind(data2, data1)
stock50 <- stock50[,-48]
stock50 <- as.data.frame(stock50)
adjacency_matrix <- matrix(rep(0,2401), ncol = 49)
a = 0
b = 1
for (j in 2:50) {
  for (i in 2:50) {
    a = a + 1
    adjency_matrix[a,b] <- cor(stock50[,i], stock50[,j])
  }
   b = b + 1
   a = 0
}

abs_adjency_matrix <- abs(adjency_matrix)
adjency_matrix_0.3 <- ifelse(abs_adjency_matrix > 0.3, 1, 0)

degree_0.3 <- array(0, 49)
for (i in 1:49) {
  degree_0.3[i] <- sum(adjency_matrix_0.3[,i])
}


adjency_matrix_0.4 <- ifelse(abs_adjency_matrix > 0.4, 1, 0)
degree_0.4 <- array(0, 49)
for (i in 1:49) {
  degree_0.4[i] <- sum(adjency_matrix_0.4[,i])
}


adjency_matrix_0.5 <- ifelse(abs_adjency_matrix > 0.5, 1, 0)
degree_0.5 <- array(0, 49)
for (i in 1:49) {
  degree_0.5[i] <- sum(adjency_matrix_0.5[,i])
}


adjency_matrix_0.6 <- ifelse(abs_adjency_matrix > 0.6, 1, 0)
degree_0.6 <- array(0, 49)
for (i in 1:49) {
  degree_0.6[i] <- sum(adjency_matrix_0.6[,i])
}


adjency_matrix_0.7 <- ifelse(abs_adjency_matrix > 0.7, 1, 0)
degree_0.7 <- array(0, 49)
for (i in 1:49) {
  degree_0.7[i] <- sum(adjency_matrix_0.7[,i])
}
adjency_matrix_0.7 <- as.data.frame(adjency_matrix_0.7)
degree_dataframe <- data.frame(degree_0.3, degree_0.4, degree_0.5, degree_0.6, degree_0.7)
write.xlsx(degree_dataframe, file = 'degree_dataframe')
write.xlsx(adjency_matrix_0.7, file = 'adjency_matrix_0.7.xlsx')
