$(document).ready(function(){      
var menubar = "<nav class='menuBarOpen'><ul>"
			 +"<li class='menubarblock'><a href='#'>마이페이지</a></li>"
			 +"<li class='menubarblock'><a href='/board/reviewlist'>한줄리뷰게시판</a></li>"
			 +"<li class='menubarblock'>이미지게시판</li></ul></nav>";
 $('#menu').append(menubar);
 $(".menuBarOpen").hide();
 $("#menu").on("click", function(e) {
 
 		e.stopPropagation();
        $(".menuBarOpen").slideToggle();

	})
	$('.menubarblock').on("click",function(e){
		e.stopPropagation();
	
	}) 
})
$(document).on("click", function (e) {
   // 토글 영역이 아닌 영역을 클릭하면 토글을 숨김
   if (!$(e.target).closest('.menuBarOpen').length) {
       $(".menuBarOpen").slideUp();
   }
});
