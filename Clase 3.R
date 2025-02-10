# Clase 10/02/25
# Me dio problema Markdown para actualizar en el dispositivo.
# Importar datos a R proveniente de distintas fuentes


# Importar datos ----------------------------------------------------------
# Usamos la función "read.csv"

ocampo <-read.csv("Datos_ocampo.csv", header = T)
# Importante para estadística mencionar que tiene encabezado (header), incluir el tipo de formato que es (.csv), y el nombre que sea entre comillas.
ocampo
getwd() # getwd() nos informa de la carpeta en la que estamos trabajando.

names(ocampo)

mean(ocampo$TEMP) #funcion(objeto$variable).  el signo de pesos focaliza.

mean(ocampo$DIRS)

#Las graficas histograma no es lo mismo que las graficas de barra. Histogramas me brindan la frecuencia de valores. La grafica de barras me brinda acumulación de valores, no frecuencia.

boxplot(ocampo$TEMP, col = "orange", main= "Temperatura Ocampo") 
#indica el 100% de los datos. La caja gris indica el 50% de los datos. Del cuadro hacia las líneas exteriores son 25% (25 hacia abajo y 25 hacia arriba).
# La línea negra es la MEDIANA (valor más repetido). Este ejemplo nos dice que la curva está inclinada a los valores más bajos, en su distribución.
# Los colores van en comillas.

hist(ocampo$TEMP, col= "indianred", 
     main= "Temperatura Ocampo", 
     xlab = "Temperatura (°c)", 
     ylab = "Frecuencia")

# Estadística paramétrica y no paramétrica. Paramétrica es más robusta. Hay una contraparte para cada modelo de una u otra.
# Transformación de los datos para tratar de pasar de no-paramétrica a paramétrica.

#Experimento balanceado y no-balanceado. Balanceado es cuando los tratamientos tienen misma cantidad de objetos de estudio.

stem(ocampo$TEMP) 
#Tallo y hoja. El entero en la primera columna y los demás valores son los decimales. 
#Si la acuestas se parece a un histograma. Usada cuando se empleaban maquinas de escribir. 

#Boxplot también te da los valores extremos (outlayers). Se representan como puntos/circulitos. Errores de dedo o casos especiales. Boxplot es más completa.
boxplot(ocampo$VELR)

vivero <- read.csv("Viveros.csv", header = T)
vivero$Tratamiento <- as.factor(vivero$Tratamiento)
boxplot(vivero$IE ~ vivero$Tratamiento, xlab="Tratamientos", ylab="IE")

# as.factor indica que una columna es un factor determinante para los valores. Pasar de una base de datos compleja a sencilla para poder usarla en el sistema.
# Sirve para analisis estadisticos más completos/complejos. Si no, no lo identifica como un factor. Ya que busca Factores.
# la virgulilla te dice que me grafique una variable con respecto a otra.

# T-student.
# Una muestra, dos muestras independientes y dos muestras dependientes.

# Una muestra: comparado con un valor definido. Una referencia. "Media teorética".
# Dos independientes: Dos grupos, misma variables.
# Dos dependientes: Un grupo, una variable, dos tiempos distintos.

#Homogeneidad de varianzas y normalidad de los datos. Factores clave.
# Normalidad: Shapiro-Wild, Kormogorov.
# Varianzas: Barlet, Prueba de F.

#Alfa. Límite. 0.05. Con un 95% de confiabilidad en el resultado.
# p-value. Contrastar con Alfa. -1 a 1. # ¿Qué pedo con p-value y alfa"