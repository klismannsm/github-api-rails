var Components = {};
var $document = $(document);

var formatString = function() {
  var args = arguments;
  var template = args[0];
  return template.replace(/{(\d+)}/g, function(match, number) {
    return typeof args[number] != 'undefined' ? args[number] : match;
  });
};
