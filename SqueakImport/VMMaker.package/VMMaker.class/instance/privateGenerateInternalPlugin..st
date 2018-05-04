generate sources
privateGenerateInternalPlugin: pluginName 
	"generate the named internal plugin"
	| plugin |
	"Refuse to translate this plugin if it is not in the internal plugins list or requires platform specific support and it is not present."
	[plugin := self validateInternalPlugin: pluginName] on: VMMakerException do:[:ex | self inform: ex messageText].

	plugin
		ifNil: [^ self couldNotFindPluginClass: pluginName].
	plugin
		translateInDirectory: (self internalPluginsDirectoryFor: plugin)
		doInlining: inline.
	logger show: 'internal plugin ' , plugin name , ' generated as ' , plugin moduleName; cr.
	self processFilesForInternalPlugin: plugin.
