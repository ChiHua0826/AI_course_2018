#安裝neuralnet函式庫
install.packages('neuralnet')
#引用neuralnet函式庫
library(neuralnet)

#讀取訓練資料
training_data <- read.csv(file.choose(), header = TRUE)

name <- names(training_data)
formula <- as.formula(paste("Class ~", 
           paste(name[!name %in% "Class"], collapse = " + ")))

#設定亂數種子
set.seed(0)
#訓練神經網路
model <- neuralnet(formula, training_data, 
                   hidden=c(2), linear.output = FALSE)
#繪製神經網路
plot(model)

#讀取測試資料
testing_data <- read.csv(file.choose(), header = TRUE)
testing_data_input <- subset(testing_data, select = -Class)

#將測試資料代入模型進行預測,並取得預測結果
pred <- compute(model, testing_data_input)
#運用表格呈現和比對預測結果
table(round(pred$net.result), testing_data$Class)