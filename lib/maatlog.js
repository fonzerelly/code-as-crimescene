#!/usr/bin/env node
var exec = require('child_process').exec;
var argv = require('minimist')(process.argv.slice(2));
var cmd = `git log --date=short --numstat --pretty=format:\"[%h] %an %ad %s\" --before=${argv.before} --after=${argv.after}`;

exec(cmd, function(error, stdout, stderr) {
    if (error) {
        console.error(stderr)
    }
    console.log(stdout);
})
