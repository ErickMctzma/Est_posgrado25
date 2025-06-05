# Parte 1. 
## Gastos totales ejemplo MCF.
celular<-300
transporte<-240
comestible<-1527
gimnasio<-400
alquiler<-1500
otros<-1833
gastosmes<-celular+transporte+comestible+gimnasio+alquiler+otros
gastosmes

##Gasto al semestre (5 meses hábiles)
gastos_semestre<-gastosmes*5
gastos_semestre
gastos_año<-gastos_semestre*2
gastos_año

##Creación de vector, conjuntar datos.
gastos<-c(celular,transporte,comestible,gimnasio,alquiler,otros)
?barplot
barplot(gastos)
barplot(gastos,col = blues9,names.arg = gastos, horiz = TRUE)
?sort
barplot(sort(gastos,decreasing = TRUE),col = blues9,main = "Cash gone", xlab = "Fijos", ylab = "Mx pesos", names.arg = c("otros","comestible","alquiler","gimnasio","celular","transporte"))
#tedious write the names, more if you change the arrangment
#Cada cosa que vaya a ser puro texto (ejemplo:labels) debe encerrarse en "comillas"

