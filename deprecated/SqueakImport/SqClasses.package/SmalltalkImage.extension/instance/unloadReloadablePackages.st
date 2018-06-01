*SqClasses-*SqClasses-*SqClasses-shrinking
unloadReloadablePackages
	"Unload packages which can be reloaded."

	"One special case to make Services-Base unload"
	Smalltalk
		at: #ServiceRegistry
		ifPresent: [ : aClass | SystemChangeNotifier uniqueInstance noMoreNotificationsFor: aClass ].

	#('CompressionTests'
'CollectionsTests'
'GraphicsTests'
'BalloonTests'
'HelpSystem-Tests'
'KernelTests'
'MorphicExtrasTests'
'MorphicTests'
'MultilingualTests'
'NetworkTests'
'ToolsTests'
'TraitsTests'
'SystemChangeNotification-Tests'
'VersionNumberTests'
'ST80Tests'
"'Tests'" "Currently not unloadable"

'FlexibleVocabularies'
'ReleaseBuilder'
'ScriptLoader'
'UpdateStream'
'CommandLine'
'45Deprecated'
'311Deprecated'
'39Deprecated'
'Universes'
'SMLoader'
'SMBase'
'Services-Base'
'Nebraska'
'ToolBuilder-MVC'
'ST80Tools'
'ST80'
"'EToys'" "Currently not unloadable"
"'PreferenceBrowser'" "Etoys needs them, hence not unloadable"
"'Protocols'" "Etoys needs them, hence not unloadable"
'XML-Parser'
'Help-Squeak-TerseGuide'
'Help-Squeak-Project'
'HelpSystem-Core'
'SystemReporter'
'SUnitGUI'
'VersionNumber' ) do: [ : pkgName | Installer mc unload: pkgName ].
	"Traits use custom unload"
	Smalltalk
		at: #Trait
		ifPresent: [ : aClass | aClass unloadTraits ]
