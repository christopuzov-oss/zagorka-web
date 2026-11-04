// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
// require aos.min
//= require flickity.min
//= require fullpage
//= require_tree .

if (getCookie("zagorkacompany-age-restriction") != "1" && window.location.pathname != '/age-gate') {
  window.localStorage.setItem('zagorkacompanyReturnURL', window.location.origin + window.location.pathname);
  query = window.location.search.substring(1);
  window.location.href = '/age-gate?' + query;
}

$('a[href^="http://"]').each(function() {
  $(this).attr('target','_blank');
});

$('a[href^="https://"]').each(function() {
  $(this).attr('target','_blank');
});

$('a[href^="https://zagorkacompany.bg/"]').each(function() {
  $(this).attr('target','_self');
});

function getCookie(cname) {
  var name = cname + "=";
  var ca = document.cookie.split(';');
  for(var i=0; i<ca.length; i++) {
    var c = ca[i];
    while (c.charAt(0)==' ') c = c.substring(1);
      if (c.indexOf(name) == 0) {
        return c.substring(name.length, c.length);
    }
  }
  return "";
}

function setCookie(cname, cvalue, exdays) {
  var d = new Date();
  d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
  var expires = "expires="+d.toUTCString();
  document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

$(function(){ 
  $(document).foundation();

  $( "#verDay" ).on('input', function() {
    if($( "#verDay" ).val().length > 1) {
      $( "#verMonth" ).select();
    }
  });
  $( "#verMonth" ).on('input', function() {
    if($( "#verMonth" ).val().length > 1) {
      $( "#verYear" ).select();
    }
  });

  $("section.article img").click(function() {
    if ( $(this).parent().hasClass('thumb') || $(this).parent().hasClass('thumbnail') ) {
      return
    }

    if($(this).hasClass('zoom-in')) {
      zoomOut();
    } else {
      zoomIn($(this));
    }
  });

  $('#menuButton').click(function (e) {
    if($(this).hasClass('no-active')) {
      $('#mainMenuModal').removeClass('is-reveal-closed').addClass('is-reveal-open');
      $('#menuButton').addClass('is-active').removeClass('no-active');
    } else {
      $('#mainMenuModal').removeClass('is-reveal-open').addClass('is-reveal-closed');
      $('#menuButton').removeClass('is-active').addClass('no-active');
    }
  });

  $('.search-button').click(function (e) {
    e.preventDefault();
    if($(this).hasClass('no-active')) {
      $('#searchForm').removeClass('is-reveal-closed').addClass('is-reveal-open');
      $(this).addClass('is-active').removeClass('no-active');
    } else {
      $('#searchForm').removeClass('is-reveal-open').addClass('is-reveal-closed');
      $(this).removeClass('is-active').addClass('no-active');
    }
  });

  if ($('section.age-gate').length > 0) {
    login.init();
    $('#verify').submit(function() {
      var valid = true;
      $(this).find('input[type="text"]').each(function() {
        if (!isNumber($(this).val())) {
          valid = false;
        }
      });

      var date = new Date($('#verYear').val(), $('#verMonth').val(), $('#verDay').val());
      if (login.verify(date)) {
        setCookie("zagorkacompany-age-restriction", 1, 0.04);
        backPath = window.localStorage.getItem('zagorkacompanyReturnURL');
        if (backPath == null) { 
          backPath = window.location.origin;
        }
        window.localStorage.removeItem('zagorkacompanyReturnURL');
        window.location.href = backPath;
      } else {
        alert($(this).attr('data-error'));
      }
      return false;
    });
  }
  iframeResize();
});


function zoomIn(selector) {
  selector.toggleClass('zoom-in');
  selector.after('<div class=img-bg></div>');
}

function zoomOut() {
  $(".article img").removeClass('zoom-in');
  $("zoom-in + .img-bg").remove;
}
$(document).scroll(function () {
  zoomOut();
});

var login = {
  init: function() {
    var instance = this;
    $('.input-wrapper input[type="text"]').keyup(function(e) {
      var val = $(this).val();
      if (val.match(/[0-9]+/)) {
        if ($(this).attr('id') == 'verDay') {
          if (parseInt(val) > 31) {
            $(this).val("");
              return false;
            }
          }
          if ($(this).attr('id') == 'verMonth') {
            if (parseInt(val) > 12) {
              $(this).val("");
              return false;
            }
          }
          if ($(this).attr('id') == 'verYear') {
            var year = new Date().getFullYear();
            if ((val.length) > 3 && parseInt(val) < (year - 100)) {
              $(this).val("");
              return false;
            }
          }
        } else {
          $(this).val("");
        }
    });
  },
  verify: function(date) {
    if (calcAge(date) >= 18 && calcAge(date) < 120) {
      return true;
    } else {
      return false;
    } 
  }
}

function calcAge(dateString) {
  var birthday = +dateString;
  return ~~((Date.now() - birthday) / (31557600000));
}

function isNumber(n) {
  return !isNaN(parseFloat(n)) && isFinite(n);
}

function iframeResize() {
  $(".article iframe").each(function() {
    var iWidth = $(this).attr('width');
    var iHeight = $(this).attr('height');
    if (iWidth > iHeight ) {
      radio = (iHeight / iWidth) * 100;
      var wrapper = document.createElement("div");
      wrapper.style.paddingBottom = radio + '%';
      wrapper.classList.add('flex-video');
      $(this).wrap(wrapper);
    }
  });
}

function readURL(input) {
  
  selector = "img#temp_" + input.id
  remove_link = "a#remove_" + input.id
  if (input.files && input.files[0]) {
    $("#fileNameLabel").text(input.files[0].name)
  }
}
