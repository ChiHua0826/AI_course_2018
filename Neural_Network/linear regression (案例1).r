#�w��neuralnet�禡�w
install.packages('neuralnet')
#�ޥ�neuralnet�禡�w
library(neuralnet)

#Ū���V�m���
training_data <- read.csv(file.choose(), header = TRUE)

#�]�w�üƺؤl
set.seed(0)
#�V�m�u�ʰj�k
model <- neuralnet(Y ~ X, training_data, 
                   hidden=c(0), linear.output = TRUE, 
                   threshold = 0.0000001)
#ø�s�u�ʰj�k
plot(model)

#Ū�����ո��
testing_data <- read.csv(file.choose(), header = TRUE)
testing_data_input <- subset(testing_data, select = -Y)

#�N���ո�ƥN�J�ҫ��i��w��,�è��o�w�����G
pred <- compute(model, testing_data_input)
#�e�{���p���G
print(pred$net.result)