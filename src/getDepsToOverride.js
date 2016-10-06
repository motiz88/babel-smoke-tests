var glob = require('glob');
var path = require('path');

module.exports = function getDepsToOverride (dependentsPool, dependenciesPoolMap) {  
  var deps = [];
  dependentsPool.forEach(function (package) {
    var packageJson = require(path.resolve(package.location, "package.json"));
    for (var dependency in (packageJson.dependencies || {})) {
      if (dependenciesPoolMap[dependency]) {
        deps.push({type: "dependencies", location: package.location, name: dependency})
      }
    }
    for (var devDependency in (packageJson.devDependencies || {})) {
      if (dependenciesPoolMap[devDependency]) {
        deps.push({type: "devDependencies", location: package.location, name: devDependency})
      }
    }
  });
  return deps;
};