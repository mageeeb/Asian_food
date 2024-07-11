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
      const newComment = document.createElement('div');
      newComment.classList.add('card', 'mb-3', 'comment-card');
      newComment.innerHTML = `
        <div class="card-body">
          <h5 class="card-title">${nomUtilisateur}</h5>
          <div>Note : ${Array(parseInt(ratingValue, 10)).fill('<i class="bi bi-star-fill"></i>').join('')}</div>
          <p class="card-text">${commentaire}</p>
          <button type="button" class="btn btn-sm btn-danger delete-comment">Supprimer</button>
        </div>
      `;
      return newComment;
    }

    // Ajouter un commentaire soumis
    evaluationForm.addEventListener('submit', function(event) {
      event.preventDefault();

      // Récupérer la note sélectionnée
      const selectedRating = document.querySelector('input[name="rating"]:checked');
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
      commentList.appendChild(newComment);

      // Réinitialiser le formulaire
      evaluationForm.reset();

      // Faire défiler jusqu'au bas de la liste des commentaires
      newComment.scrollIntoView({ behavior: 'smooth', block: 'end' });
    });

    // Supprimer un commentaire
    commentList.addEventListener('click', function(event) {
      if (event.target.classList.contains('delete-comment')) {
        const commentCard = event.target.closest('.comment-card');
        commentCard.remove();
      }
    });
  });
  