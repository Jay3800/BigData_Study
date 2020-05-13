st <- data.frame(state.x77)
st
colnames(st) # 열 이름
rownames(st) # 행 이름
dim(st) # 행과 개수와 열의 개수
str(st) # 요약 정보
rowSums(st[])  # 행별 합계
rowMeans(st[]) #행별 평균
colSums(st[])  #열별 합계
colMeans(st[]) # 열별 평균

# Florida 주의 모든 정보
st["Florida",]

# 50개 주의 수입(Incom) 정보
st[, "Income"]

# Texas 주의 면적(Area)
st["Texas", 'Area']

# Ohio 주의 인구(Population)와 수입(Income)
st['Ohio', c('Population', 'Income')]

# 인구가 5,000 이상인 주
Pop <- subset(st, Population>=5000)
Pop

# 수입이 4,500 이상인 주의 인구, 수입, 면적
Info <- subset(st, Income>=4500)
Info[, c('Population', 'Income', 'Area')]

# 수입이 4,500 이상인 주의 갯수
Inc <- subset(st, Income>=4500)
nrow(Inc)

# 전체 면적(Area)이 100,000 이상이고, 
# 결빙일수(Frost)가 120 이상인 주의 정보
Info2 <- subset(st, Area>=100000 & Frost>=120)
Info2

# 인구(Population)가 2,000 미만이고,
# 범죄율(Murder)이 12 미만인 주의 정보
Info3 <- subset(st, Population<2000 & Murder<12)
Info3

# 문맹률(Illiteracy)이 2.0 이상인 주의 평균 수입
Inc2 <- subset(st, Illiteracy>=2.0)
mean(Inc2[,2])

# 문맹률(Illiteracy)이 2.0 미만인 주와
# 2.0 이상인 주의 평균 수입의 차이
a <- subset(st, Illiteracy<2.0)
b <- subset(st, Illiteracy>=2.0)
c <- mean(a[,2])
d <- mean(b[,2])
c-d

# 기대수명(Life Exp)이 가장 높은 주
max(st[,"Life.Exp"])
Life <- subset(st, Life.Exp==73.6)
rownames(Life)

# Pennsylvania 주보다 수입(Income)높은 주
st['Pennsylvania', 'Income']
Inc3 <- subset(st, Income>4449)
rownames(Inc3)
