#安裝tensorflow函式庫
install.packages('tensorflow')
#安裝keras函式庫
install.packages('keras')

#引用tensorflow函式庫
library(tensorflow)
#引用keras函式庫
library(keras)

#讀取訓練資料
training_data <- read.csv(file.choose(), header = TRUE)

#設定亂數種子
use_session_with_seed(0)

#設定神經網路結構
model <- keras_model_sequential() 
model %>% 
  layer_dense(units = 1, activation = "sigmoid", input_shape = c(1))  %>% #輸入參數: 1個, 輸出參數: 1個, 線性函式
  layer_dense(units = 1, activation = "sigmoid") #輸入參數: 1個, 輸出參數: 1個, 線性函式

#設定神經網路學習目標
model %>% compile(
  loss='mean_squared_error', #最小平方誤差
  optimizer='sgd' #梯度下降
)

#訓練神經網路
history <- model %>% fit(
  training_data$X, #輸入參數
  training_data$Y, #輸出參數
  epochs = 30000, #訓練回合數
  batch_size = 1 #逐筆修正權重
)

#顯示神經網路權重值
model$get_weights()

#將測試資料代入模型進行預測,並取得預測結果
results <- model %>% predict(
  training_data$X
)

#呈現估計結果
print(results)
