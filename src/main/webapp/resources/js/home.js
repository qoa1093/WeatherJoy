function init(){
			 const options = {
		        timeZone: 'Asia/Seoul',
		        timeZoneName: 'short',
		        year: 'numeric',
		        month: '2-digit',
		        day: '2-digit',
		    };
		
		    var newDate = new Date().toLocaleString('en-US', options);
			console.log(newDate);
		    let year = newDate.substring(6,10);
		    let mon = newDate.substring(0,2);
		    let day = newDate.substring(3,5);
            $('#txtYear').val(year);
            
            //var newDate = new Date();
            //newDate.setDate(newDate.getDate()-1);
			$('#txtYear').val(year);
			mon = parseInt(mon);
            
            if(mon<10){
                mon = "0" + mon;
            }
            $("#selMon").val(mon);

            d = parseInt(day);
            if(d<10){
                d = "0" + d;
            }
            $('#selDay').val(d);

            /*$('#txtYear').val(newDate.getFullYear());
			console.log(newDate.getMonth());
            var mon = newDate.getMonth()+1;
            
            if(newDate.getMonth()<10){
                mon = "0" + mon;
            }
            $("#selMon").val(mon);

            var d = newDate.getDate()+1;
            if(newDate.getDate()<10){
                d = "0" + d;
            }
            $('#selDay').val(d);*/
}
        function getDate(){
            var newDate = new Date();
            newDate.setDate(newDate.getDate());
            var str = newDate.getFullYear();
            

            var mon = newDate.getMonth()+1;
            if(newDate.getMonth()<10){
                mon = "0" + mon;
            }
            str =str + mon;

            var d = newDate.getDate()
            if(newDate.getDate()<10){
                d = "0" + d;
            }
            str = str + d;
            return str;
        }

        function show(selectedValue,reCityName){
            var url = "https://apis.data.go.kr/B551011/KorService1/searchKeyword1?serviceKey=ibNDydv%2BVD1XxdnbSBCwRIZ4nfiYnptFv6FveU0wGfu4yRPisWSg%2F1gRJgdgRxOvOm6DlzNjTEJrjZkDyxNwbw%3D%3D";
            url = url + '&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=xml&listYN=Y&arrange=A&keyword='+reCityName+'&contentTypeId='+selectedValue;
            $(".cb2").text("");
            console.log("----: "+url);
            $.ajax({
                    type : "GET",
                    url : url,
                    dataType:"xml",
                    success:function(data){
                        console.log(data);
                        var str = "";
                        $(data).find("item").each(function(){
                            str = str+ "<h1>이름 : "+$(this).find("title").text()+"</h1>";
                        str = str+ "<h2>컨텐츠타입(예 12:관광) : "+$(this).find("contenttypeid").text()+"</h2>";
                        str = str + "<p> : " + $(this).find("firstimage").text()+"</p>";
                            
                        });
                            
                        $(".cb2").append(str);
                    }, error : function(){
                        alert("error");
                    }})
        }
       
           
        
        function month(){
            var mon='';
            for(i=1;i<13;i++){
                if(i<10){
                mon += '<option value=0'+i+'>'+i+'월</option>';
                }else{ 
                mon += '<option value='+i+'>'+i+'월</option>';
            }}
            $('#selMon').append(mon);
        }
        function day(){
            $('#selDay').empty();
            let y =$('#txtYear').val();
            let m = $('#selMon').val();
            var lastDateOfMonth = new Date(y, m, 0).getDate();
            var day = '';
            for(i=1;i<=lastDateOfMonth;i++){
                if(i<10){
                day += '<option value=0'+i+'>'+i+'일</option>';
                }else{ 
                day += '<option value='+i+'>'+i+'일</option>';
            }
            }
            $('#selDay').append(day);
        }
        let goodList = [];
        let veryGoodList = [];
        function goodDayList(){
            
            var url = "https://apis.data.go.kr/1360000/TourStnInfoService1/getCityTourClmIdx1?serviceKey=ibNDydv%2BVD1XxdnbSBCwRIZ4nfiYnptFv6FveU0wGfu4yRPisWSg%2F1gRJgdgRxOvOm6DlzNjTEJrjZkDyxNwbw%3D%3D";
                url = url + "&pageNo=1&numOfRows=500&dataType=XML&DAY=0&CURRENT_DATE="+$('#txtYear').val() + $('#selMon').val()+$('#selDay').val();//(getDate());//
                console.log("------"+url);

                $.ajax({
                    type : "GET",
                    url : url,
                    dataType:"xml",
                    success:function(data){
                        var str = "";
                        console.log("연결성공000");    
                        console.log(data);
                        //console.log(":::"+$(data).find("item").find("doName").text());
                        if($(data).find("item").find("TCI_GRADE").text() == ""){
                            alert("일일자료가 존재하지 않습니다.");
                            return;
                        }
                        $(data).find("item").each(function(){
                            if($(this).find("TCI_GRADE").text() === "좋음"){
                            console.log("좋음 : "+ $(this).find("cityName").text());
                            goodList.push($(this).find("totalCityName").text());
                            if(setNum%4==0){ setFullNum++;}
                            getCard(setNum, $(this).find("totalCityName").text(), $(this).find("TCI_GRADE").text());
                            
                            setNum++;
                            
                            }else if($(this).find("TCI_GRADE").text() === "매우좋음"){
                                let card1 = "매우좋음 : "+ $(this).find("cityName").text();
                                console.log("매우좋음 : "+ $(this).find("cityName").text());
                                veryGoodList.push($(this).find("totalCityName").text());
                                if(setNum%4==0) setFullNum++;
                                getCard(setNum, $(this).find("totalCityName").text(), $(this).find("TCI_GRADE").text());
                                setNum++;
                                
                            }else{
                                //console.log("나쁨 또는 보통 : " + $(this).find("cityName").text());
                            }                            
                           
                            //str = str + $(this).find("totalCityName").text(); 
                            //str = str + $(this).find("TCI_GRADE").text() + "<br>";
                            //console.log(str + " " );
                        })
                        
                        veryGoodList.forEach(item => {
                            str = str + item + " : " + "매우좋음" + "<br>";
                        });
                        
                        goodList.forEach(item => {
                            str = str + item + " : " + "좋음" + "<br>";
                        });
                        console.log(cardText);
                        $(".cb1").append(cardText);
                        for (let i = 0; i < setNum; i++) {
                            if(i>3){
                                $('.cardNo'+i).addClass('hide');
                                //setFullNum = 1;
                        }                            
                        }                        
                        console.log(veryGoodList);
                        console.log(goodList);
                        
                    },
                    error : function(){alert("error")}
                })
        }
        $(document).ready(function(){
            month();
            day();
            init();
            $('#bt1').click(function(e){
                e.preventDefault();
                $('.cb1').html(""); 
                $(".cb2").text("");           
            if(cardText !== "") {cardText = ""; setNum=1; setFullNum=1;}
            goodDayList();
            })
            $('a').click(function(event){
                event.stopPropagation();
            })
            $(document).on('click','.transed' ,function(event){
                //해당 카드번호 실행
                //e.preventDefault();
                event.stopPropagation();                 
                console.log("클릭");
                reCityName = $(this).attr('id');
                if (reCityName.includes('구')) {
                    reCityName = reCityName.replace('구', '');
                    reCityName = reCityName.substring(0,2);
                    //tourType();
                    
                    //show(reCityName.substring(0,2)); // '구' 자 제거
                }else{
                    console.log( "시 : "+reCityName.substring(reCityName.lastIndexOf(' '), reCityName.length-1));
                    reCityName = reCityName.substring(reCityName.lastIndexOf(' ')+1, reCityName.length-1)
                }
                //console.log(" 아이디값 :" +$(this).attr('id') + "부모의 아이디값 : " + $('[name="tourNum"]').parent().attr('id'));
                if($(this).attr('id')!==$('[name="tourNum"]').parent('.transed').attr('id')||!$('[name="tourNum"]').length>0){
                    if($('[name="tourNum"]').length>0){
                        $('[name="tourNum"]').remove();
                    }
                    $(this).append(tourType());        
                }
                //show(reCityName);                
            })
var reCityName;
var currentSet = 1;


/*$(document).on('change', '[name="tourNum"]', function() {
        var selectedValue = $(this).val();
        console.log(selectedValue);
        
            show(selectedValue, reCityName); // 선택한 값으로 show() 함수 호출
        
    });*/
function tourType(){
    //12:관광지, 14:문화시설, 15:축제공연행사, 25:여행코스, 28:레포츠, 32:숙박, 38:쇼핑, 39:음식점
    
    var tourStr =  '<select name="tourNum" id="TNum">'+
                    '<option value="" selected>보고싶은 정보</option>'+
                    '<option value="12">관광지</option>'+
                    '<option value="14">문화시설</option>'+
                    '<option value="15">축제공연행사</option>'+
                    '<option value="25">여행코스</option>'+
                    '<option value="28">레포츠</option>'+
                    '<option value="32">숙박</option>'+
                    '<option value="38">쇼핑</option>'+
                    '<option value="39">음식점</option>'+
                    '</select>';
    return tourStr;
}
 $(document).on('change', '[name="tourNum"]', function() {
                const selectedValue = $(this).val();
                 //show(selectedValue, reCityName); 
                // 선택된 데이터에 따라 URL 구성
                const encodedSelectedValue = encodeURIComponent(selectedValue);
    			const encodedReCityName = encodeURIComponent(reCityName);
                const url = "/contentType?selectedValue=" + encodedSelectedValue + "&reCityName=" + encodedReCityName;               
                // 해당 페이지로 이동
                
                console.log(url);
                window.location.href = url;           
        });


$('.fa-circle-chevron-right').on('click', function() {
    console.log("totalSets: "+setFullNum + " "+ setNum);
    if (currentSet < setFullNum) {
        currentSet++;
        updateCardVisibility();
    }
});

$('.fa-circle-chevron-left').on('click', function() {
    if (currentSet > 1) {
        currentSet--;
        updateCardVisibility();
    }
});

function updateCardVisibility() {
    var startIndex = (currentSet - 1) * 3 + 1;
    var endIndex = Math.min(currentSet * 3, setNum-1);

    for (var i = 1; i < setNum; i++) {
        if (i >= startIndex && i <= endIndex) {
            $('.cardNo' + i).removeClass('hide');
        } else {
            $('.cardNo' + i).addClass('hide');
        }
    }
}
            /*
            &pageNo=1
            &numOfRows=10
            &dataType=XML
            &CURRENT_DATE=2018123110
            &DAY=3
            &CITY_AREA_ID=5013000000
            */
            
        })
        //totalCityName을 수정해서 집어넣기
        //가져온 정보를 넣어서 div가 클릭될 시 해당 정보들을 리턴함
        function getTour(){
            
        }
        var cardText = "";
        let setNum = 1;
        let setFullNum = 1;
        function getCard(setNum, totalCityName, TCI_GRADE){
            
            cardText = cardText + //cardno1 : 카드 고유 번호 , fullset1 : 3개 마다 셋트바뀜
                '<div class="recommendCard transed cardNo'+setNum+' fullset'+setFullNum+'"'+'id ="'+totalCityName+'">'+
                    '<i class="fa-solid fa-temperature-low">'+'</i>'+
                    '<div id = "fixText">'+
                    '<p>관광지 이름 <br/>' +totalCityName+'</p>'+
                    '<p>관광지 날씨 <br/> '+ TCI_GRADE+'</p>'+
                    '<p><a href="#">리뷰게시판</a></p></div>'+
                    '</div>';
           return {totalCityName, TCI_GRADE};
        }
