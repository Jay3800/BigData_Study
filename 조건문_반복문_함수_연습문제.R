# iris 데이터셋의 행별 합계를 출력
apply(iris[,1:4], 1, sum)

# iris 데이터셋의 열별 최댓값을 출력
apply(iris[,1:4], 2, max)

mtcars
# mtcars 데이터셋의 열별 합계
apply(mtcars[,], 2, sum)

# mtcars 데이터셋의 열별 최댓값
apply(mtcars[,], 2, max)

# mtcars 데이터셋의 열별 표준편차
apply(mtcars[,], 2, sd)

# 3.
v1 <- c(7,1,2,8,9)
x <- 0
maxmin <- function(x){
  result <- data.frame[max(v1), min(v1)]
  
}
result$max; result$min

x <- 0
maxmin <- function(x){
  maxmin <- data.frame(max(x), min(x))
}
result <- maxmin(iris[,1])
result$max; result$min

weight <- c(69, 50, 55, 71, 89, 64, 59, 70, 71, 80)
# 몸무게가 가장 큰 값 위치
which.max(weight)
# 몸무게가 가장 작은 값 위치
which.min(weight)
# 몸무게가 61에서 69사이인 값 위치
which(61<weight & weight<69)
# 몸무게가 60 이하인 값들만 추출하여 weight.2에 저장
idx <- which(weight<=60)
weight.2 <- weight[idx]
weight.2

# 꽃잎의 길이(Petal.Length)가 가장 큰 관측값(행)
iris[which.max(iris[,'Petal.Length']),]

# 꽃잎의 폭(Petal.Width)이 0.3 ~ 0.4 사이인 관측값(행)
iris[which(iris[,'Petal.Width']>=0.3 
      & iris[,'Petal.Width']<=0.4),]






