#�w��neuralnet�禡�w
install.packages('neuralnet')
#�ޥ�neuralnet�禡�w
library(neuralnet)

#Ū���V�m���
training_data <- read.csv(file.choose(), header = TRUE)

#�]�w�üƺؤl
set.seed(0)
#�V�m���g����
model <- neuralnet(Y ~ X, training_data, 
                   hidden=c(1), linear.output = FALSE, 
                   threshold = 0.00001)
#ø�s���g����
plot(model)

#Ū�����ո��
testing_data <- read.csv(file.choose(), header = TRUE)
testing_data_input <- subset(testing_data, select = -Y)

#�N���ո�ƥN�J�ҫ��i��w��,�è��o�w�����G
pred <- compute(model, testing_data_input)
#�e�{���p���G
print(pred$net.result)