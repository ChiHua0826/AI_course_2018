#安裝rpart和MASS函式庫
install.packages('rpart')
install.packages('MASS')
#引用rpart和MASS函式庫
library(rpart)
library(MASS)

#讀取訓練資料
training_data <- read.csv(file.choose(), header = TRUE)
#轉換為因子矩陣
training_data <- data.frame(lapply(training_data, as.factor))

#訓練CART決策樹
model <- rpart(Class ~ ., data = training_data, method="class", 
               control=rpart.control(minsplit=1))
#繪製決策樹
library(partykit)
plot(as.party(model))

#讀取測試資料
testing_data <- read.csv(file.choose(), header = TRUE)
#轉換為因子矩陣
testing_data <- data.frame(lapply(testing_data, as.factor))

#將測試資料代入模型進行預測,並取得預測結果
pred <- predict(model, testing_data, type='class')
#運用表格呈現和比對預測結果
table(pred, testing_data$Class)
