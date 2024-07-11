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


  document.addEventListener('DOMContentLoaded', function() {
    const evaluationForm = document.getElementById('evaluationForm');
    const commentList = document.getElementById('commentList');

    // Fonction pour créer une carte de commentaire avec options de suppression
    function createCommentCard(nomUtilisateur, commentaire, ratingValue) {
      const newComment = `
        <div class="card mb-3">
          <div class="card-body">
            <h5 class="card-title">${nomUtilisateur}</h5>
            <p class="card-text">${commentaire}</p>
            <div>Note :
              ${Array.from({ length: parseInt(ratingValue, 10) }, () => '<i class="bi bi-star-fill"></i>').join('')}
            </div>
            <button type="button" class="btn btn-sm btn-danger mt-2 delete-comment">Supprimer</button>
          </div>
        </div>
      `;
      return newComment;
    }

    // Ajouter un commentaire soumis
    evaluationForm.addEventListener('submit', function(event) {
      event.preventDefault();

      // Récupérer la note sélectionnée
      const selectedRating = document.querySelector('input[name="note"]:checked');
      const ratingValue = selectedRating ? selectedRating.value : null;

      // Récupérer le commentaire et le nom de l'utilisateur
      const nomUtilisateur = document.getElementById('nomUtilisateur').value;
      const commentaire = document.getElementById('commentaire').value;

      if (!ratingValue || !commentaire || !nomUtilisateur) {
        alert('Veuillez remplir tous les champs.');
        return;
      }

      // Créer une nouvelle carte de commentaire avec le nom d'utilisateur
      const newComment = createCommentCard(nomUtilisateur, commentaire, ratingValue);

      // Ajouter le nouveau commentaire à la liste
      commentList.insertAdjacentHTML('beforeend', newComment);

      // Réinitialiser le formulaire
      evaluationForm.reset();
    });

    // Supprimer un commentaire
    commentList.addEventListener('click', function(event) {
      if (event.target.classList.contains('delete-comment')) {
        const commentCard = event.target.closest('.card');
        commentCard.remove();
      }
    });
  });


  