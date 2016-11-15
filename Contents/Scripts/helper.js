function running()
{
	return [];
}

function filter(results, input)
{
	return results.filter(function(value) {
		return value.indexOf(input) > -1;
	});
}

function tmuxinator(input)
{
    var tmuxinator = LaunchBar.execute("/bin/ls", "/Users/JT/.tmuxinator").split("\n");

	return tmuxinator.map(function(value) {
		value = value.split(".");
		value.pop();

		return value.join(".");
	});
}
