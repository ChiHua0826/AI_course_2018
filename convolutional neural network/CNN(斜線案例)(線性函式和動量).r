#安裝tensorflow函式庫
install.packages('tensorflow')
#安裝keras函式庫
install.packages('keras')

#引用tensorflow函式庫
library(tensorflow)
#引用keras函式庫
library(keras)

#讀取訓練資料
X <- read.csv('C:/Users/user/Desktop/X_斜線案例.csv', header = TRUE)
Y <- read.csv('C:/Users/user/Desktop/Y_斜線案例.csv', header = TRUE)
#轉換為matrix資料型態
X <- data.matrix(X)
X <- array_reshape(X, c(nrow(X), 2, 2, 1))
Y <- data.matrix(Y)

#設定亂數種子
use_session_with_seed(2)

#設定神經網路結構
model <- keras_model_sequential()
model %>%
  layer_conv_2d(filters = 1, kernel_size = c(2, 2), 
                activation = 'linear', input_shape = c(2, 2, 1)) %>% 
  layer_flatten() %>% 
  layer_dense(units = 1, activation = 'linear')

#設定神經網路學習目標
model %>% compile(
  loss='mean_squared_error', #運用最小平方誤差計算誤差
  optimizer=optimizer_sgd(lr = 0.01, momentum = 0.5) #梯度下降
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
results <- model %>% predict(
  X
)

#呈現估計結果
print(results)
