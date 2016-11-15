include("helper.js");

var run = function(input)
{
	return filter(tmuxinator().concat(running()), input);
}
