var Fs = require('fs');
var Path = require('path');

var bundlePath = 'bundle';

var out = { dependencies: {} };

var bundles = Fs.readdirSync(bundlePath);
bundles.forEach(function (bundle) {
  try {
    var
      bowerFile = Path.join(bundlePath, bundle, '.bower.json'),
      contents = Fs.readFileSync(bowerFile, 'utf-8'),
      data = JSON.parse(contents);

    var
      name = data.name,
      target = data._target,
      source = data._originalSource;

    if (target === '*') target = data._release;

    out.dependencies[name] = source + "#" + target;
  } catch (e) {
  }
});

console.log(JSON.stringify(out, null, 2));