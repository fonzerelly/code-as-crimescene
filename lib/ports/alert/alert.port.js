module.exports = {
    init: (app) => {
        app.ports.check.subscribe(function(word) {
            window.alert(word);
            code_as_crimescene.ports.suggestions.send("from port");
        })
    }
}
