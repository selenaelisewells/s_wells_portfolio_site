import PortfolioList from './PortfolioList.js';
import PortfolioOverlay from './PortfolioOverlay.js';

const PortfolioContainer = Vue.component('portfolio-container', {
    data: () => ({
        'projects': [],
        'currentProjectId': 0,
        'open': false
    }),
    mounted: function() {
        // PRETEND THIS IS YOUR OWN PHP SCRIPT
        // fetch('/includes/allProjects.php')
        fetch('./includes/allProjects.php')
            .then(result => result.json())
            .then(data => {
                console.log('----- THE FETCH DATA ------');
                console.log(data);
                // CODE USED TO MAKE EXAMPLE WORK


                this.projects = data.map(piece => {

                    return {
                        ...piece,
                        feature_type: piece.f_type,
                        images: piece.images.split(','),
                        tools: piece.tools.split(','),
                        types: piece.types.split(',')

                    }
                });
                console.log('----- THE PROJECTS DATA ------');
                console.log(this.projects);
                this.currentProjectId = this.projects[0].id;
            });
    },
    computed: {
        currentProject: function() {
            return this.projects.filter(project => project.id === this.currentProjectId)[0];
        }
    },
    methods: {
        handleProjectSelect: function(projectId) {
            this.currentProjectId = projectId;
            this.open = true;
        },
        handleOverlay: function() {
            this.open = false;
        }
    },
    components: {
        'portfolio-list': PortfolioList,
        'portfolio-overlay': PortfolioOverlay
    },
    template: `
        <div class="portfolio-container">
            <portfolio-overlay :open="open" @overlay-closed="handleOverlay" :project="currentProject" v-if="currentProject"></portfolio-overlay>
            <portfolio-list :projects="projects" v-if="projects" @project-selected="handleProjectSelect"></portfolio-list>
            <h2 v-if="!projects">Loading Projects...</h2>
        </div>
    `
});

export const HomepagePortfolioContainer = Vue.component('homepage-portfolio-container', {
    data: () => ({
        'projects': [],
    }),
    mounted: function() {
        // PRETEND THIS IS YOUR OWN PHP SCRIPT
        fetch('./includes/allProjects.php')
            .then(result => result.json())
            .then(data => {
                this.projects = data.map(piece => {
                    return {
                        ...piece,
                        feature_type: piece.f_type,
                        images: piece.images.split(','),
                        tools: piece.tools.split(','),
                        types: piece.types.split(',')

                    }
                });
                this.currentProjectId = this.projects[0].id;
            });
    },
    components: {
        'portfolio-list': PortfolioList,
        'portfolio-overlay': PortfolioOverlay
    },
    template: `
        <div class="portfolio-container">
            <portfolio-list :projects="projects" v-if="projects"></portfolio-list>
            <h2 v-if="!projects">Loading Projects...</h2>
        </div>
    `
});


export default PortfolioContainer;