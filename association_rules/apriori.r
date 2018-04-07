#安裝arules函式庫
install.packages('arules')
#引用arules函式庫
library(arules)

#讀取檔案
load_data <- read.csv(file.choose(), header = TRUE)
#轉換為矩陣
load_data <- as.matrix(load_data)

#執行apriori方法,並把結果存到rules變數
rules <- apriori(load_data, parameter=list(supp=0.6, conf=0.8))  

#顯示關聯規則結果
inspect(rules)
