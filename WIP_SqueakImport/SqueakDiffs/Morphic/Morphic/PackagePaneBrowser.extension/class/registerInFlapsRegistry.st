*Morphic-MorphicExtras-class initialization
registerInFlapsRegistry
	"Register the receiver in the system's flaps registry"
	self environment
		at: #Flaps
		ifPresent: [:cl | cl registerQuad: {#PackagePaneBrowser. #prototypicalToolWindow	.	'Packages' translatedNoop.		'Package Browser:  like a System Browser, except that if has extra level of categorization in the top-left pane, such that class-categories are further organized into groups called "packages"' translatedNoop}
						forFlapNamed: 'Tools']