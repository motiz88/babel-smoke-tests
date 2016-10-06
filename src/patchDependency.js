var spawn = require('cross-spawn');

module.exports = function patchDependency (dependencyRecord, dependencyPoolMap) {
  console.log('patching ', dependencyRecord.location, ' for ', dependencyRecord.name);
  if (!dependencyPoolMap[dependencyRecord.name].linked) {
    spawn.sync("npm", ["link"], {cwd: dependencyPoolMap[dependencyRecord.name].location, stdio: "inherit"});
    dependencyPoolMap[dependencyRecord.name].linked = true;
  }
  spawn.sync("npm", ["link", dependencyRecord.name], {cwd: dependencyRecord.location, stdio: "inherit"});
};