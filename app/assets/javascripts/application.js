// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
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
    sectionsColor: ['white', '#E8E8E8', '#f2f2f2', '#EC008C'],
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

