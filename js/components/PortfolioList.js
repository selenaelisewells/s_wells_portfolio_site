import PortfolioOverlay from "./PortfolioOverlay";

const PortfolioList = Vue.component('portfolio-list', {
    props: [
        'projects'
    ],
    template: `
    <div class="portfolio-list">
    <div v-for="project in projects" :key="project.id" class="portfolio-image"    @click="$emit('project-selected', project.id)">
        <img :src="getImagePath(project.teaser_image)" :alt="project.name" />
       
            <div class="portfolio-rollover">
                <h2>{{ project.name }}</h2>
                <p>{{ project.description }}</p>
            </div>
        
    </div>
    </div>
    `,
    methods: {
        getImagePath: function(image) {
            console.log(image);
            return `./images/teaserImages/${image}`;
        }
    }
});

export default PortfolioList;