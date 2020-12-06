import { fetchData } from "./dataMiner.js";

(() => {
    console.log('loaded');


    function retrieveProjectInfo(event) {
        // test for an ID
        //check for an id and if theere isnt one - leave function
        if (!event.target.id) { return }

        fetchData(`./includes/index.php?ID=${event.target.id}`).then(data => console.log(data)).catch(err => console.log(err));
    }

    function renderPortfolioThumbnails(thumbs) {
        console.log(thumbs)
        let thingSection = document.querySelector('.things-section'),
            thingTemplate = document.querySelector('#things-template').content;

        for (let thing in thumbs) {



            let currentThing = thingTemplate.cloneNode(true),
                currentThingText = currentThing.querySelector('.thing').children,
                currentThingBox = currentThing.querySelector(".thing");


            currentThingText[1].src = `images/${thumbs[thing].Image}`;
            currentThingText[1].id = thumbs[thing].ID;
            // add this new thing to the view
            currentThingBox.dataset.name = thumbs[thing].Name;
            currentThingBox.dataset.image = `images/${thumbs[thing].Image}`;
            currentThingBox.dataset.description = thumbs[thing].Description;

            currentThingBox.addEventListener("click", lightboxHandler);


            thingSection.appendChild(currentThing);
        }

        thingSection.addEventListener("click", retrieveProjectInfo);
    }

    fetchData("./includes/index.php").then(data => renderPortfolioThumbnails(data)).catch(err => console.log(err));
})