#安裝neuralnet函式庫
install.packages('neuralnet')
#引用neuralnet函式庫
library(neuralnet)

#讀取訓練資料
training_data <- read.csv(file.choose(), header = TRUE)

#設定亂數種子
set.seed(0)
#訓練神經網路
model <- neuralnet(Y ~ X, training_data, 
                   hidden=c(1), linear.output = TRUE, 
                   threshold = 0.00001)
#繪製神經網路
plot(model)

#讀取測試資料
testing_data <- read.csv(file.choose(), header = TRUE)
testing_data_input <- subset(testing_data, select = -Y)

#將測試資料代入模型進行預測,並取得預測結果
pred <- compute(model, testing_data_input)
#呈現估計結果
print(pred$net.result)