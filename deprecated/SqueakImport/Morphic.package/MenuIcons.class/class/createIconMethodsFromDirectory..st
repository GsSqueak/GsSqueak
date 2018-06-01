icons creation
createIconMethodsFromDirectory: directory 
	"
	Preferences disable: #showWorldMainDockingBar. 
	MenuIcons createIconMethodsFromDirectory: '/home/dgd/'. 
	Preferences enable: #showWorldMainDockingBar.
	"
	| iconContentsSourceTemplate iconSourceTemplate normalSize smallSize |
	iconContentsSourceTemplate := '{1}IconContents
	"Private - Method generated with the content of the file {2}"
	^ ''{3}'''.
	iconSourceTemplate := '{1}Icon
	"Private - Generated method"
	^ Icons
			at: #''{1}''
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self {1}IconContents readStream) ].'.
	""
	normalSize := #('back' 'configuration' 'confirm' 'forward' 'fullScreen' 'help' 'home' 'jump' 'objectCatalog' 'objects' 'paint' 'project' 'publish' 'squeak' 'volume' 'window' 'open' 'loadProject' ).
	smallSize := #('smallExport' 'smallAuthoringTools' 'smallDebug' 'smallBack' 'smallCancel' 'smallConfiguration' 'smallCopy' 'smallCut' 'smallDelete' 'smallDoIt' 'smallExpert' 'smallFind' 'smallForward' 'smallFullScreen' 'smallHelp' 'smallHome' 'smallInspectIt' 'smallJump' 'smallLanguage' 'smallNew' 'smallObjectCatalog' 'smallObjects' 'smallOk' 'smallOpen' 'smallPaint' 'smallPaste' 'smallPrint' 'smallProject' 'smallPublish' 'smallQuit' 'smallRedo' 'smallRemoteOpen' 'smallSave' 'smallSaveAs' 'smallSelect' 'smallSqueak' 'smallUndo' 'smallUpdate' 'smallVolume' 'smallWindow' 'smallLeftFlush' 'smallCentered' 'smallJustified' 'smallRightFlush' 'smallFonts' 'smallLoadProject' ).
	normalSize , smallSize
		do: [:each | 
			| png base64 contentsSelector selector | 
			png := directory , each , '.png'.
			base64 := self base64ContentsOfFileNamed: png.
			""
			contentsSelector := (each , 'IconContents') asSymbol.
			((self respondsTo: contentsSelector)
					and: [(self perform: contentsSelector)
							= base64])
				ifFalse: [| contentsSource | 
					contentsSource := iconContentsSourceTemplate format: {each. png. base64}.
					self class compile: contentsSource classified: 'private - icons'].
			""
			selector := (each , 'Icon') asSymbol.
			(self respondsTo: selector)
				ifFalse: [| source | 
					source := iconSourceTemplate format: {each}.
					self class compile: source classified: 'private - icons']].
	""
	self initializeIcons