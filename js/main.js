(() => {


    let mainNav = document.querySelector('.navWrap');
    let navBarToggle = document.getElementById('js-navbar-toggle');

    navBarToggle.addEventListener('click', function() {

        console.log('she works');

        mainNav.classList.toggle('selected');
    });




})();