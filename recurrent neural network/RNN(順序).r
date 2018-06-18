#�w��tensorflow�禡�w
install.packages('tensorflow')
#�w��keras�禡�w
install.packages('keras')

#�ޥ�tensorflow�禡�w
library(tensorflow)
#�ޥ�keras�禡�w
library(keras)

X  <-  as.matrix(read.csv("C:/Users/user/Desktop/x(����).csv"))
Y  <-  as.matrix(read.csv("C:/Users/user/Desktop/y(����).csv"))

#�ഫ��matrix��ƫ��A
X <- data.matrix(X)
X <- array_reshape(X, c(nrow(X), 2, 1))

#�]�w�üƺؤl
use_session_with_seed(0)

#�]�w���g�������c
model <- keras_model_sequential() 
model %>% 
  layer_simple_rnn(units = 1, activation = "linear", use_bias = TRUE, input_shape =c(2, 1)) %>% 
  layer_dense(units = 1, activation = "linear")

#�]�w���g�����ǲߥؼ�
model %>% compile(
  loss='mean_squared_error', #�̤p����~�t
  optimizer='sgd' #��פU��
)

#�V�m���g����
history <- model %>% fit(
  X, #��J�Ѽ�
  Y, #��X�Ѽ�
  epochs = 5000, #�V�m�^�X��
  batch_size = 1 #�v���ץ��v��
)

#��ܯ��g�����v����
model$get_weights()

#�N���ո�ƥN�J�ҫ��i��w��,�è��o�w�����G
results <- model$predict(X)

#�e�{���p���G
print(results)
