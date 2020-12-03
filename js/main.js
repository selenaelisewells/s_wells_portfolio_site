import { SendMail } from "./modules/mailer.js";
import { showError, removeError } from "./modules/validator.js";
(() => {


    let mainNav = document.querySelector('.navWrap');
    let navBarToggle = document.getElementById('js-navbar-toggle');

    navBarToggle.addEventListener('click', function() {

        console.log('she works');

        mainNav.classList.toggle('selected');
    });



    let contactForm = document.querySelector('#mail-form');

    function processMailFailure(result) {
        // show a failure message in the UI
        console.table(result); // table shows us an object in table form
        alert(result.message);

        // show some UI here to let the user know the mail attempt was successful
    }

    function processMailSuccess(result) {
        // show a success message in the UI
        console.table(result); // table shows us an object in table form
        alert(result.message);

        // show some UI here to let the user know the mail attempt was successful
    }

    function processMail(event) {
        // block the default submit behaviour
        event.preventDefault();

        // use the SendMail component to try to process mail
        SendMail(event.target)
            .then(data => processMailSuccess(data))
            .catch(err => processMailFailure(err));

        // the error handler in the catch block could actually be a generic catch-and-display function that handles EVERY error you might encounter during runtime. Might be a better strategy to pass in a flag or just a message and have the function display it in the UI
    }

    contactForm.addEventListener("submit", processMail);

    const formInputs = document.querySelectorAll("input,select,textarea");

    formInputs.forEach(input => {
        input.addEventListener("change", event => {
            console.log("its working potato")
            const element = event.currentTarget;
            console.log(element.required);
            if (!element.required) {
                return;
            }
            if (!element.checkValidity()) {
                return showError(element, element.dataset.errorMessage);
            }
        });

    })



})();