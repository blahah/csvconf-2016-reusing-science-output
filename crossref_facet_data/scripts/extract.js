var data = require('../data/works.json')
var fs = require('fs')

Object.keys(data.message.facets).forEach(function (facet_name) {
  var facet = data.message.facets[facet_name]
  var values = facet.values
  var csv = `${facet_name},count\n`
  Object.keys(values).forEach(function (key) {
    var value = values[key]
    csv += `"${key}",${value}\n`
  })
  fs.writeFileSync(`data/${facet_name}.csv`, csv, 'utf8')
})
