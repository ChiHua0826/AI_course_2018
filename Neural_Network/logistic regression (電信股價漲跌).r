#�w��neuralnet�禡�w
install.packages('neuralnet')
#�ޥ�neuralnet�禡�w
library(neuralnet)

#Ū���V�m���
training_data <- read.csv(file.choose(), header = TRUE)

name <- names(training_data)
formula <- as.formula(paste("Class ~", 
           paste(name[!name %in% "Class"], collapse = " + ")))

#�]�w�üƺؤl
set.seed(1)
#�V�m�޿�j�k
model <- neuralnet(formula, training_data, 
                   hidden=c(0), linear.output = FALSE)
#ø�s�޿�j�k
plot(model)

#Ū�����ո��
testing_data <- read.csv(file.choose(), header = TRUE)
testing_data_input <- subset(testing_data, select = -Class)

#�N���ո�ƥN�J�ҫ��i��w��,�è��o�w�����G
pred <- compute(model, testing_data_input)
#�B�Ϊ��e�{�M���w�����G
table(round(pred$net.result), testing_data$Class)
