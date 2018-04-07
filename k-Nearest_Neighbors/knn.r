#引用class函式庫
library(class)

#載入訓練資料集合
training_dataset <- read.csv(file.choose(), header = TRUE)
#載入測試資料集合
testing_dataset <- read.csv(file.choose(), header = TRUE)

#取得訓練資料集合中的資料屬性部分
training_data <- subset(training_dataset, select = -Class)
#取得測試資料集合中的資料屬性部分
testing_data <- subset(testing_dataset, select = -Class)
#取得訓練資料集合中的類別資訊部分
training_label <- training_dataset$Class
#取得測試資料集合中的類別資訊部分
testing_label <- testing_dataset$Class

#KNN分類結果
predict_label <- knn(training_data, testing_data, training_label, k = 3, prob=TRUE)

#將結果輸出成表格
table(predict_label, testing_label)
