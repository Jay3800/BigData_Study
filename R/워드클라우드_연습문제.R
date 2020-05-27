# 공공데이터포털에서 서울시 서대문구의 유치원 현황(2014년 9월)
 # 자료를 다운로드하여 유치원의 위치를 지도상에 마커로 표시하시오.
kid <- read.csv('유치원현황(2014.9월)_cng.csv')
head(kid)

addr <- c(kid[,'소.재.지'])
addr

library(ggmap)
register_google(key='AIzaSyCp6amsdvl_p638NVtCUvbEQiTh4ygjKL0')
gc <- geocode(enc2utf8(addr))
tail(gc)

cen <- c(mean(gc$lon), mean(gc$lat)) # 지도의 중심점
map <- get_googlemap(center=cen,
                     maptype="roadmap",
                     zoom=12,
                     size=c(640,640),
                     markers=gc)
ggmap(map)

# 공동데이터포털에서 '2016년도 시도 시군구별 교통사고' 통계를
 # 다운로드하시오. 다운로드한 파일 중에서'2016년_시도_시군구별_월별_교통사고.csv'에 대해 다음 물음에 답하세요.
# 01) 월별 발생건수, 사망자수, 부상자수를 집계하여 출력하시오.
# 02) 시도별 발생건수, 사망자수, 부상자수를 집계하여 출력하시오.
ac <- read.csv('2016년_시도_시군구별_월별_교통사고.csv')
ac
# 01)
ac1 <- subset(ac, select=c('월','발생건수','사망자수','부상자수'))
ac1
ac1 <- aggregate(cbind(ac1$발생건수, ac1$사망자수, ac1$부상자수), by=list(월=ac1$월), FUN=sum)
ac1
colnames(ac1)[2] <- '발생건수'
colnames(ac1)[3] <- '사망자수'
colnames(ac1)[4] <- '부상자수'
ac1
# 02)
ac2 <- subset(ac, select=c('시도','발생건수','사망자수','부상자수'))
ac2
ac2 <- aggregate(cbind(ac2$발생건수, ac2$사망자수, ac2$부상자수), by=list(시도=ac2$시도), FUN=sum)
ac2
colnames(ac2)[2] <- '발생건수'
colnames(ac2)[3] <- '사망자수'
colnames(ac2)[4] <- '부상자수'
head(ac2)

#국가통계포털 사이트에서 '2016년도 전국 음식점 정보 통계'를 가져와서
 # '채식전문점'이 위치한 시도를 출력하세요.
food <- read.csv('한국관광공사_전국_음식점_정보_20160906.csv')
food

food1 <- subset(food, select=c('카테고리3','지역명'))
food1
food1 <- subset(food1, 카테고리3=='채식전문점')
food1
food1 <- food1[!duplicated(food1[2]),]
food1
