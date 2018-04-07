#安裝neuralnet函式庫
install.packages('neuralnet')
#引用neuralnet函式庫
library(neuralnet)

#讀取訓練資料
training_data <- read.csv(file.choose(), header = TRUE)

#設定亂數種子
set.seed(1)
#訓練線性迴歸
model <- neuralnet(Future ~ Current, training_data, 
                   hidden=c(0), linear.output = TRUE)
#繪製線性迴歸
plot(model)

#讀取測試資料
testing_data <- read.csv(file.choose(), header = TRUE)
testing_data_input <- subset(testing_data, select = -Future)

#將測試資料代入模型進行預測,並取得預測結果
pred <- compute(model, testing_data_input)
#運用呈現估計結果
print(pred$net.result)
