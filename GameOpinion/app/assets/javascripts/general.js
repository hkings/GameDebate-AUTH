//This file has the Semantic-ui initialization stuff and application layout scripts

//cards hover effects.
$('.special.cards .image').dimmer({
  on: 'hover'
});

//message close on x click
$('.message .close')
  .on('click', function() {
    $(this)
      .closest('.message')
      .transition('fade')
    ;
  })
;

//make flash messages desapear
$(function() {
  setTimeout(function(){
    $('.message').slideUp(300);
  }, 1500);
});


//switching main nav-nar active state.
var root = window.location.pathname;
if (root === "/") {
	$("#sign-in").removeClass("active");
	$("#sign-up").removeClass("active");
	$("#home").addClass("active");
}
else if (root.includes("sign_in")) {
	$("#home").removeClass("active");
	$("#sign-up").removeClass("active");
	$("#sign-in").addClass("active");
}
else if (root.includes("sign_up")) {
	$("#home").removeClass("active");
	$("#sign-in").removeClass("active");
	$("#sign-up").addClass("active");
}
else if (root.includes("hot_topic")) {
  $("#home").removeClass("active");
  $("#sign-up").removeClass("active");
  $("#sign-in").removeClass("active");
  $("#hot").addClass("active");
}
else if (root.includes("newest")) {
  $("#home").removeClass("active");
  $("#sign-in").removeClass("active");
  $("#sign-up").removeClass("active");
  $("#newest").addClass("active");

}

else{
  $("#home").removeClass("active");
  $("#sign-in").removeClass("active");
  $("#sign-up").removeClass("active");
  $("#newest").removeClass("active");
}



