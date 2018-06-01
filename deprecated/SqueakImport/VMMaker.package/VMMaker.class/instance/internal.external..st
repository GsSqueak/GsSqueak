initialize
internal: arrayOfInternalPluginNames external: arrayOfExternalPluginNames
	"try to set up with the listed internal and external plugins. Check that they are supportable plugins, reject those that are not - remember that this depends on the platform etc. This is the batch equivalent of using the VMMakerTool to drag each plugin to the relevant list(s) "

	"the intersection of the availablePlugins list and the input list stops any attempt to force in an improper plugin class"
	internalPlugins := (self availablePlugins intersection: arrayOfInternalPluginNames) select: [:pl | self canSupportPlugin: pl].
	allPlugins := allPlugins copyWithoutAll: internalPlugins.
	externalPlugins := (allPlugins intersection: arrayOfExternalPluginNames) select: [:pl | self canSupportPlugin: pl ].
	allPlugins := allPlugins copyWithoutAll: externalPlugins.
	