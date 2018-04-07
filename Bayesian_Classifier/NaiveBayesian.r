#安裝e1071函式庫
install.packages('e1071')
#引用e1071函式庫
library(e1071)

#讀取訓練資料
training_data <- read.csv(file.choose(), header = TRUE)
#轉換為因子矩陣
training_data <- data.frame(lapply(training_data, as.factor))

#訓練單純貝氏模型
model <- naiveBayes(Class ~ ., data = training_data)

#讀取測試資料
testing_data <- read.csv(file.choose(), header = TRUE)
#轉換為因子矩陣
testing_data <- data.frame(lapply(testing_data, as.factor))

#將測試資料代入模型進行預測,並取得預測結果
pred <- predict(model, testing_data)
#運用表格呈現和比對預測結果
table(pred, testing_data$Class)
