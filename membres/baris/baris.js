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

    $(document).ready(function(){
      $("#toggle-evaluation").click(function(){
        $("#evaluations").toggle();
        var buttonText = $("#evaluations").is(":visible") ? "Masquer l'évaluation" : "Afficher l'évaluation";
        $(this).text(buttonText);
      });
    });



    