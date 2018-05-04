utilities
makerFor: interpreterClass and: cogitClassOrNil to: srcDirName platformDir: platDirName excluding: exclusions
	"Initialize a VMMaker to generate the VM to the given target directory. Exclude plugins in pluginList.
	Example:
		(VMMaker
			makerFor: CoInterpreter
			and: SimpleStackBasedCogit
			to: (FileDirectory default pathFromURI: '../src')
			platformDir: (FileDirectory default pathFromURI: '../platforms')
			excluding:#(
				BrokenPlugin DShowVideoDecoderPlugin IA32ABIPluginSimulator
				NewsqueakIABIPlugin NewsqueakIABIPluginAttic
				QuicktimePlugin QVideoCodecPlugin QwaqMediaPlugin
				SlangTestPlugin TestOSAPlugin ThreadedFFIPlugin 
				Win32OSProcessPlugin))
			generateInterpreterFile.
	"
	| maker |
	maker := self forPlatform: 'Cross'.
	maker sourceDirectoryName: srcDirName.
	maker platformRootDirectoryName: platDirName.
	maker interpreterClass: interpreterClass.
	cogitClassOrNil ifNotNil: [maker cogitClass: cogitClassOrNil].
	maker externalModules addAll: 
		(maker availablePlugins reject:[:plugin| exclusions includes: plugin]).
	^maker
