document.addEventListener('DOMContentLoaded', function () {
    var carousel = new bootstrap.Carousel(document.getElementById('carouselExampleIndicators2'));


    // Contrôle des flèches pour le carousel
    var prevBtn = document.querySelector('.flecheGauche');
    var nextBtn = document.querySelector('.flecheDroite');

    prevBtn.addEventListener('click', function (e) {
        e.preventDefault(); // Empêche le comportement par défaut de l'ancre
        carousel.prev(); // Change de slide précédent dans le carousel

    });

    nextBtn.addEventListener('click', function (e) {
        e.preventDefault(); // Empêche le comportement par défaut de l'ancre
        carousel.next(); // Change de slide suivant dans le carousel

    });
});