#安裝C50和MASS函式庫
install.packages('C50')
install.packages('MASS')
#引用C50和MASS函式庫
library(C50)
library(MASS)

#讀取訓練資料
training_data <- read.csv(file.choose(), header = TRUE)
#轉換為因子矩陣
training_data <- data.frame(lapply(training_data, as.factor))

#訓練C5.0決策樹
model <- C5.0(Class ~ ., data = training_data)
#繪製決策樹
plot(model)

#讀取測試資料
testing_data <- read.csv(file.choose(), header = TRUE)
#轉換為因子矩陣
testing_data <- data.frame(lapply(testing_data, as.factor))

#將測試資料代入模型進行預測,並取得預測結果
pred <- predict(model, testing_data)
#運用表格呈現和比對預測結果
table(pred, testing_data$Class)
