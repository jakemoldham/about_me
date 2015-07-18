//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require jquery.pagepiling
//= require jquery.pagepiling.min
//= require_tree .

$(document).ready(function() {
  /*
  * Plugin intialization
  */
  $('#pagepiling').pagepiling({
    verticalCentered:false,
    css3:false,
    sectionsColor: ['black', '#E8E8E8', '#333333', '#E8E8E8'],
    onLeave: function(index, nextIndex, direction){

      //fading out the txt of the leaving section
      $('.section').eq(index -1).find('h1, p').fadeOut(700, 'easeInQuart');

      //fading in the text of the destination (in case it was fadedOut)
      $('.section').eq(nextIndex -1).find('h1, p').fadeIn(700, 'easeInQuart');


      //reaching our last section? The one with our normal site?
      if(nextIndex == 4){

        //fading out navigation bullets
        $('#pp-nav').fadeOut();

        $('#section4').find('.content').animate({
            top: '0%'
        }, 700, 'easeInQuart');
      }

      //leaving our last section? The one with our normal site?
      if(index == 4){
          //fadding in navigation bullets
        $('#pp-nav').fadeIn();

        $('#section4 .content').animate({
            top: '100%'
        }, 700, 'easeInQuart');
      }
    },
  });
});

$('#arrow').click(function () {
  $.fn.pagepiling.moveSectionDown();
});

