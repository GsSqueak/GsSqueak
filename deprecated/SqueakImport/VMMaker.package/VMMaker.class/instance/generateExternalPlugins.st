generate sources
generateExternalPlugins
	"generate the external plugins"

	self externalPluginsDo: [:plugin | 
		self generateExternalPlugin: plugin].
	self storeExternalPluginList.