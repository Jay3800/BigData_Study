# trees 데이터셋에서 나무 둘레(Girth)로 나무의 볼륨(Volume)을
# 예측하는단순선형 회귀모델을 만드시오.
# 그리고 나무 둘레가 8.5, 9.0, 9.5 일 때 나무의 볼륨을 예측하여 보시오.

head(trees)
model <- lm(Volume~Girth, data=trees)
model
unknown <- data.frame(cbind(8.5, 9.0, 9.5))
volume <- 5.066*unknown -36.943 
volume
# 예측
colnames(volume)[] <- c(8.5, 9.0, 9.5)
volume

# mlbench 패키지의 BostonHousing 데이터셋은 보스턴 지역의 지역 정보 및 평균 주택가격(medv) 정보가 저장되어 있다.
# 다른 변수들을 이용하여 medv를 예측하는 모델을 만드시오.(단 chas 변수는 모델을 만들 때 제외한다.)
library(mlbench)
data(BostonHousing) # 데이터셋 불러오기

# 1) 전체 변수를 이용하여 평균 주택가격(medv)을 예측하는 회귀모델을 만들고 회귀식을 나타내시오.
head(BostonHousing)
newdata <- BostonHousing
newdata <- subset(newdata, select = -c(chas))
head(newdata)

model <- lm(medv~crim+zn+indus+nox+rm+age+dis+rad+tax+ptratio+b+lstat, data=newdata)
model

# 2) 평균 주택가격(medv)을 예측하는 데 도움이 되는 변수들만 사용하여 예측하는 회귀모델을 만들고 회귀식을 나타내시오.
model2 <- stepAIC(model)

# 3) 1), 2)에서 만든 예측모델의 설명력(Adjusted R-squared)을 비교해 보시오.
summary(model)
summary(model2)

# UCLA 대학원의 입학 데이터를 불러와서 mydata에 저장한 후 다음 물음에 답하시오.
mydata <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
head(mydata)

# 1) gre, gpa, rank를 이용해 합격 여부(admit)를 예측하는 로지스틱 모델을 만드시오(0:불합격, 1:합격)
model <- glm(admit~., data=mydata)# 로지스틱 회귀모델
summary(model)

# 2) mydata에서 합격 여부(admit)를 제외한 데이터를 예측 대상 데이터로 하여
  # 1)에서 만든 모델에 입력하여 합격 여부를 예측하고 실제값과 예측값을 나타내시오.
test <- mydata[,2:4]
head(test)
pred <- predict(model, test)
pred
pred <- round(pred,0)

# 3) 만들어진 모델의 예측 정확도를 나타내시오.
answer <- mydata[,1]
answer
pred == answer
acc <- mean(pred==answer)
acc