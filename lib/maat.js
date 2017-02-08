#!/usr/bin/env node
var exec = require('child_process').exec;
var argv = require('minimist')(process.argv.slice(2));
var cmd = `java -jar ${__dirname}/code-maat-1.0-SNAPSHOT-standalone.jar`;

if (argv.in) {
    cmd += ` -l ${argv.in} -c git`
}
if (argv.type) {
    cmd += ` -a ${argv.type}`
}
if (argv.out) {
    cmd += ` > ${argv.out}`
}

exec(cmd, function(error, stdout, stderr) {
    if (error) {
        console.error(stderr)
    }
    console.log(stdout);
})
