var spawn = require('cross-spawn');

module.exports = function patchDependency (dependencyRecord, dependencyPoolMap) {
  console.log('patching ', dependencyRecord.location, ' for ', dependencyRecord.name);
  spawn.sync("npm", ["link", dependencyPoolMap[dependencyRecord.name].location], {cwd: dependencyRecord.location});
};