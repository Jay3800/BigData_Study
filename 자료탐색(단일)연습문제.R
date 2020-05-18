mtcars
# 중량(wt)의 평균값, 중앙값,
# 절사평균값(절사범위: 15%), 표준편차
WT <- mtcars[,'wt']
mean(WT)
median(WT)
mean(WT, trim=0.15)
sd(WT)

# 중량(wt)에 대해 summary() 함수
summary(WT)

# 실린더수(cyl)에 대해 summary()함수
CYL <- mtcars[,'cyl']
summary(CYL)

# 앞에서 구한 도수분포표를 막대그래프로 출력
barplot(table(WT), main='WT')
barplot(table(CYL), main='CYL')

# 중량(wt)의 히스토그램
hist(WT, # data(자료)
     main='WT', # 제목
     xlab='중량',     # x축 레이블
     ylab='중량 값',  # y축 레이블
     border='blue',   # 막대 테두리색
     col='green',     # 막대 색
     las=2,           # x축 글씨 방향(0~3)
     breaks=5         # 막대기 갯수 조절
)

# 중량(wt)에 대한 상자그림
boxplot(WT, main='중량')
boxplot.stats(WT) # 실행결과 리스트

# 배기량(disp)에 대한 상자그림
DISP <- mtcars[,'disp']
boxplot.stats(DISP) # 실행결과 리스트

# 기어수(gear)를 그룹 정보로 하여 연비(mpg)자료에 대해
# 상자그림을 작성
boxplot(mpg~gear, data=mtcars, main='기어별 연비')
par(mfrow=c(1,3))
