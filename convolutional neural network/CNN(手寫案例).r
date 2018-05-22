#安裝tensorflow函式庫
install.packages('tensorflow')
#安裝keras函式庫
install.packages('keras')

#引用tensorflow函式庫
library(tensorflow)
#引用keras函式庫
library(keras)

#類別數量
num_classes <- 10
#圖片長寬
img_rows <- 28
img_cols <- 28

#讀取訓練資料
mnist <- dataset_mnist()
X <- mnist$train$x
Y <- mnist$train$y
#轉換為matrix資料型態
X <- array_reshape(X, c(nrow(X), img_rows, img_cols, 1)) #圖片大小為28x28
Y <- to_categorical(Y, num_classes)

#設定亂數種子
use_session_with_seed(0)

#設定神經網路結構
model <- keras_model_sequential()
model %>%
  layer_conv_2d(filters = 1, kernel_size = c(3, 3), #過濾器大小為3x3
                activation = 'relu', input_shape = c(img_rows, img_cols, 1)) %>% 
  layer_flatten() %>% 
  layer_dense(units = num_classes, activation = 'softmax')

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
  epochs = 100, #訓練回合數
  batch_size = 60000 #每60000筆修正權重
)

#顯示神經網路權重值
model$get_weights()

#將測試資料代入模型進行預測,並取得預測結果
results <- model %>% predict(
  X
)

#呈現估計結果
print(results)
