const HelloWorld = Vue.component("hello-world", {

    props: ["message"],
    template: `<h1>{{message}}</h1>`,

    created: function() {
        console.log(`created ${message} card`);
    }

});
export default HelloWorld;