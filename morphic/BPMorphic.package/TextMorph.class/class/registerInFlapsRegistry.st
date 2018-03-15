class initialization
registerInFlapsRegistry
	"Register the receiver in the system's flaps registry"
	self environment
		at: #Flaps
		ifPresent: [:cl | 
			cl registerQuad: {#TextMorph. #authoringPrototype. 'Text' translatedNoop. 'Text that you can edit into anything you desire.' translatedNoop} forFlapNamed: 'PlugIn Supplies'.
			cl registerQuad: {#TextMorph. #exampleBackgroundLabel. 'Background Label' translatedNoop. 'A piece of text that will occur on every card of the background' translatedNoop} forFlapNamed: 'Scripting'.
			cl registerQuad: {#TextMorph. #exampleBackgroundField. 'Background Field' translatedNoop. 'A data field which will have a different value on every card of the background' translatedNoop} forFlapNamed: 'Scripting'.
			cl registerQuad: {#TextMorph. #authoringPrototype. 'Simple Text' translatedNoop. 'Text that you can edit into anything you wish' translatedNoop} forFlapNamed: 'Stack Tools'.
			cl registerQuad: {#TextMorph. #fancyPrototype. 'Fancy Text' translatedNoop. 'A text field with a rounded shadowed border, with a fancy font.' translatedNoop} forFlapNamed: 'Stack Tools'.
			cl registerQuad: {#TextMorph. #authoringPrototype. 'Text' translatedNoop. 'Text that you can edit into anything you desire.' translatedNoop} forFlapNamed: 'Supplies']