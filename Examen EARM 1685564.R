#Examen 24032025
#Erick Alejandro Rodriguez Moctezuma. Matrícula:1685564

set.seed(42)
n <- 30
altura <- rnorm(n,mean=170, sd=10)
peso <- 0.5 * altura + rnorm(n, mean=0, sd=50)
alturaantes <- rnorm(n, mean = 165, sd=8)
t.test(altura, alturaantes, paired = T)

plot(alturaantes)

# Correlación -------------------------------------------------------------

cor.test(altura,peso)
plot(altura,peso)

# ANOVA -------------------------------------------------------------------

set.seed(123)
suelo <- rep(c("Arcilloso","Arenoso", "Franco"), each=10)
crecimiento <- c(
  rnorm(10, mean=15,sd=2),
  rnorm(10, mean=20,sd=2),
  rnorm(10, mean=25,sd=2))

datos <- data.frame(suelo=suelo, crecimiento=crecimiento)
print(datos)


datos.aov<- aov(datos$crecimiento ~ datos$suelo)
summary(datos.aov)

boxplot(datos$crecimiento ~datos$suelo)

TukeyHSD(datos.aov)
