const glob = require('glob')

module.exports = {
    init: (app) => {
        const ports = glob.sync(__dirname + '/**/*.port.js')
        ports.forEach((port) => {
            require(port).init(app)
        })
    }
}
