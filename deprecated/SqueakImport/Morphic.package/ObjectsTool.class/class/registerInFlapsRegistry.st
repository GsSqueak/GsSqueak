class initialization
registerInFlapsRegistry
	"Register the receiver in the system's flaps registry"
	self environment
		at: #Flaps
		ifPresent: [:cl | cl registerQuad: {#ObjectsTool.	 #newStandAlone. 'Object Catalog' translatedNoop. 'A tool that lets you browse the catalog of objects' translatedNoop}
						forFlapNamed: 'PlugIn Supplies'.
						cl registerQuad: {#ObjectsTool	. #newStandAlone. 'Object Catalog' translatedNoop.'A tool that lets you browse the catalog of objects' translatedNoop}
						forFlapNamed: 'Widgets'.]