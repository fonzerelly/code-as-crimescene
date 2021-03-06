#!/usr/bin/env node
var exec = require('child_process').exec;
var argv = require('minimist')(process.argv.slice(2));
var cmd = `git log --date=short --numstat --pretty=format:\"[%h] %an %ad %s\"`

if (argv.before) {
    cmd += ` --before=${argv.before}`
}

if (argv.after) {
    cmd += ` --after=${argv.after}`
}

if (argv.out) {
    cmd += ` > ${argv.out}`;
}

exec(cmd, function(error, stdout, stderr) {
    if (error) {
        console.error(stderr)
    }
    console.log(stdout);
})
