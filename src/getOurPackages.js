var lerna = require('lerna');
var path = require('path');

module.exports = function getOurPackages () {
  var babelPackages = lerna.getPackages(lerna.getPackagesPath(path.resolve(__dirname, '../us/babel')));
  babelPackages = babelPackages.map(function (package) {
    return {name: package.name, location: package.location};
  });
  var allPackages = babelPackages.concat([{
    name: "babylon", location: path.resolve(__dirname, "../us/babylon")
  }]);
  var allPackagesMap = {};
  allPackages.forEach(function (package) {
    allPackagesMap[package.name] = package;
  });
  return allPackagesMap;
};