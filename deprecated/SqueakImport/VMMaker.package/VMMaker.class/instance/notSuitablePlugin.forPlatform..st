private - errors
notSuitablePlugin: pluginClass forPlatform: platName
	(VMMakerException new messageText: pluginClass name, ' is not suitable for building for ', platName) signal