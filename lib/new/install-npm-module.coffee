which = require('which')
exec = require("child_process").execFile

module.exports = (dest, cb) ->
  exec(which.sync('npm'), ["install", "--save-dev", "broccoli", "cabbage"], {cwd: dest}, cb)
