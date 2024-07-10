$(document).ready(function() {
    $('form').submit(function(event) {
      event.preventDefault(); 
      var $submitBtn = $(this).find('button[type="submit"]');
      $submitBtn.addClass('btn-spinning');
      setTimeout(function() {
        $submitBtn.text('Merci !');
      }, 1000); 
    });
  });