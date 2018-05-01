#�w��tensorflow�禡�w
install.packages('tensorflow')
#�w��keras�禡�w
install.packages('keras')

#�ޥ�tensorflow�禡�w
library(tensorflow)
#�ޥ�keras�禡�w
library(keras)

#Ū���V�m���
training_data <- read.csv(file.choose(), header = TRUE)

#�]�w�üƺؤl
use_session_with_seed(0)

#�]�w���g�������c
model <- keras_model_sequential() 
model %>% 
  layer_dense(units = 1, activation = "sigmoid", input_shape = c(1))  %>% #��J�Ѽ�: 1��, ��X�Ѽ�: 1��, �u�ʨ禡
  layer_dense(units = 1, activation = "sigmoid") #��J�Ѽ�: 1��, ��X�Ѽ�: 1��, �u�ʨ禡

#�]�w���g�����ǲߥؼ�
model %>% compile(
  loss='mean_squared_error', #�̤p����~�t
  optimizer='sgd' #��פU��
)

#�V�m���g����
history <- model %>% fit(
  training_data$X, #��J�Ѽ�
  training_data$Y, #��X�Ѽ�
  epochs = 30000, #�V�m�^�X��
  batch_size = 1 #�v���ץ��v��
)

#��ܯ��g�����v����
model$get_weights()

#�N���ո�ƥN�J�ҫ��i��w��,�è��o�w�����G
results <- model %>% predict(
  training_data$X
)

#�e�{���p���G
print(results)
