generate sources
validatePlugin:	plName in: listOfPlugins
"check that the plName is either an actual plugin class or a plugin class name. Return the plugin class or raise an error if nil"
	| plugin |
	plName isString
		ifTrue: [(listOfPlugins includes: plName)
				ifTrue: [plugin := Smalltalk classNamed: plName]]
		ifFalse: [((plName isBehavior
						and: [plName inheritsFrom: InterpreterPlugin])
					and: [listOfPlugins includes: plName name])
				ifTrue: [plugin := plName]].
	plugin ifNil: [^ self couldNotFindPluginClass: plName].

	"Make sure we have any and all platform and file support for this plugin"

	(plugin isSuitablePluginForPlatform: self platformName) ifFalse:[^self notSuitablePlugin: plugin forPlatform: self platformName].
		
	"Is there a cross-platform or platform files directory of the same name as this plugin?"
	plugin requiresPlatformFiles
		ifTrue: [(self platformPluginsDirectory directoryExists: plugin moduleName)
				ifFalse: [logger show: 'No platform specific files found for ' , plugin moduleName printString; cr.
					^ self couldNotFindPlatformFilesFor: plugin]].
	plugin requiresCrossPlatformFiles
		ifTrue: [(self crossPlatformPluginsDirectory directoryExists: plugin moduleName)
				ifFalse: [logger show: 'No cross platform files found for ' , plugin moduleName printString; cr.
					^ self couldNotFindPlatformFilesFor: plugin]].

	^plugin