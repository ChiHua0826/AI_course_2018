#安裝bnlearn函式庫
install.packages('bnlearn')
#引用bnlearn函式庫
library(bnlearn)

#讀取訓練資料
training_data <- read.csv(file.choose(), header = TRUE)
#轉換為因子矩陣
training_data <- data.frame(lapply(training_data, as.factor))

#訓練貝氏網路模型
bn <- tree.bayes(training_data, "Class")
model <- bn.fit(bn, training_data)

#讀取測試資料
testing_data <- read.csv(file.choose(), header = TRUE)
#轉換為因子矩陣
testing_data <- data.frame(lapply(testing_data, as.factor))

#將測試資料代入模型進行預測,並取得預測結果
pred <- predict(model, testing_data)
#運用表格呈現和比對預測結果
table(pred, testing_data$Class)

#繪製貝氏網路模型
plot(bn)
