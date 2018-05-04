generate sources
generateExternalPlugin: pluginName 
	"generate the named external plugin"
	| exports plugin |

	"Refuse to translate this plugin if it is not in the external plugins list or requires platform specific support and it is not present."
	[plugin := self validateExternalPlugin: pluginName] on: VMMakerException do:[:ex | ^self inform: ex messageText].

	exports := plugin
				translateInDirectory: (self externalPluginsDirectoryFor: plugin)
				doInlining: inline.
	logger show: 'external plugin ' , plugin name , ' generated as ' , plugin moduleName; cr.
	exports ifNotNil: ["if exp is nil we skip this since the plugin was already up to date"
			self export: exports forExternalPlugin: plugin].
	self processFilesForExternalPlugin: plugin