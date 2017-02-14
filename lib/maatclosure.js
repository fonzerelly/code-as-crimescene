#!/usr/bin/env node
var exec = require('child_process').exec;
var argv = require('minimist')(process.argv.slice(2));
var cmd = `python ${__dirname}/csv_as_enclosure_json.py `

if (argv.freqs) {
    cmd += ` --weights ${argv.freqs} --weightcolumn 1`
}

if (argv.lines) {
    cmd += ` --structure ${argv.lines}`
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
