plugin lists
canSupportPlugin: pluginClassName 
	"see if this plugin needs any external files and if so, check to see if 
	they seem to exist, as well as checking to see if the chosen platform can support it"
	[self validatePlugin: pluginClassName in: allPlugins , internalPlugins , externalPlugins]
		on: VMMakerException
		do: [:ex | self inform: ex messageText. ^false].
	^ true