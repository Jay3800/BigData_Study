#1. R을 이용하여 서울시 한강 이남의 구청들의 위치에 마커와 구청 이름을
 #지도 위에 표시하시오.

## 지도위에 마커와 텍스트 표시
# 마커 여러개와 텍스트
names <- c("강서구청","양천구청","구로구청","영등포구청",
           "금천구청", "동작구청","관악구청",
           "서초구청","강남구청","송파구청","강동구청")
addr <- c("강서구","양천구","구로구","영등포구",
          "금천구", "동작구","관악구",
          "서초구","강남구","송파구","강동구")
gc <- geocode(enc2utf8(addr))

# 관광지 명칭과 좌표값으로 dataframe 생성
df <- data.frame(name=names,
                 lon=gc$lon,
                 lat=gc$lat)
df

cen <- c(mean(df$lon), mean(df$lat)) # 지도의 중심점
map <- get_googlemap(center=cen,
                     maptype="roadmap",
                     zoom=11,
                     size=c(640,640),
                     markers=gc)
ggmap(map)

# 구청 이름 지도 위에 표시하기
gmap <- ggmap(map)
gmap+geom_text(data=df,
               aes(x=lon, y=lat),
               label=df$name)

# 2. '2018년도 시군구별 월별 교통사고 자료'로부터 서울시의 각 구별 1년 교통사고 발생건수를 지도상에 원의 크기로 나타내시오.
#- Sonar 원의 위치는 구의 위치로 하시오.
#- 원의 색은 red로 하고 투명도를 .05로 하시오.
#- 자료에는 월별로 데이터가 기록되어 있는데 1년 데이터를 합산하여 이용하시오.
#- 서울 지역이 모두 지도에 나도오록 하시오.
#* 데이터출처: 공동데이터포털(https://www.data.go.kr)에서 '교통사고통계' 검색 후 '도로교통공단_시도_시군구별_교통사고_통계(2019)'를 다운받아 사용한다.
setwd("C:/Users/TJ/Documents/R_programing")
ac <- read.csv("도로교통공단_시도_시군구별_교통사고_통계(2018)/도로교통공단_시도_시군구별_월별_교통사고(2018).csv")
head(ac)

seoul = subset(ac, 시도=="서울")
seoul
seoul <- aggregate(seoul$발생건수, by=list(시군구=seoul$시군구), FUN=sum)
seoul
colnames(seoul)[2] <- '발생건수'
seoul

addr <- c(seoul[,"시군구"])
addr
gc <- geocode(enc2utf8(addr))
gc
cen <- c(mean(gc$lon), mean(gc$lat)) # 지도의 중심점
map <- get_googlemap(center=cen,
                     maptype="roadmap",
                     zoom=11,
                     size=c(640,640),
                     markers=gc)
ggmap(map)

value <- seoul[,'발생건수']
value


# 원의 크기로 표시하기
gmap <- ggmap(map)
gmap+geom_point(data=gc,
                aes(x=lon, y=lat, size=value), # spd 열의 값
                alpha=0.5,                   # alpha : 색의 투명도
                col="red")+
  scale_size_continuous(range=c(1,14))       # 원의 크기 조절, 1~14

#3. 2번과 동일한 자료를 이용하여 광역시도별 1년 사망자수를 지도상에 원의 크기로 나타내시오.
#- 세종시는 데이터에서 삭제하시오.
#- 원의 색은 black으로 하고 투명도를 .05로 하시오.
#- 남한 지역이 모두 지도에 나오도록 하시오.
city <- aggregate(ac$사망자수~ac$시도, ac, sum)
city
city <- subset(city, city$`ac$시도`!="세종")
city <- data.frame(city)
city

gc1 <- geocode(enc2utf8(city$ac.시도))
gc1

#4. 2.번과 동일한 자료를 이용하여 광역시도별 7, 8월 부상자수를 지도상에 원의 크기로 나타내시오.
#- 세종시는 데이터에서 삭제하시오.
#- 원의 색은 black으로 하고 투명도를 .05로 하시오.
#- 남한 지역이 모두 지도에 나오도록 하시오.
