#安裝tensorflow函式庫
install.packages('tensorflow')
#安裝keras函式庫
install.packages('keras')

#引用tensorflow函式庫
library(tensorflow)
#引用keras函式庫
library(keras)

X  <-  as.matrix(read.csv("C:/Users/user/Desktop/x(語意).csv"))
Y  <-  as.matrix(read.csv("C:/Users/user/Desktop/y(語意).csv"))

#轉換為matrix資料型態
X <- data.matrix(X)
X <- array_reshape(X, c(nrow(X), 3, 2))

#設定亂數種子
use_session_with_seed(0)

#設定神經網路結構
model <- keras_model_sequential() 
model %>% 
  layer_simple_rnn(units = 1, activation = "linear", use_bias = TRUE, input_shape =c(3, 2)) %>% 
  layer_dense(units = 2, activation = "softmax")

#設定神經網路學習目標
model %>% compile(
  loss='categorical_crossentropy', #運用最小平方誤差計算誤差
  optimizer='sgd', #梯度下降
  metrics = c("accuracy")
)

#訓練神經網路
history <- model %>% fit(
  X, #輸入參數
  Y, #輸出參數
  epochs = 500, #訓練回合數
  batch_size = 1 #逐筆修正權重
)

#顯示神經網路權重值
model$get_weights()

#將測試資料代入模型進行預測,並取得預測結果
results <- model$predict(X)

#呈現估計結果
print(results)
