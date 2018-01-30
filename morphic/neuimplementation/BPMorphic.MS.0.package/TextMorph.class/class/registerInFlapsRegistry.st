class initialization
registerInFlapsRegistry
	"Register the receiver in the system's flaps registry"
	self environment
		at: #Flaps
		ifPresent: [:cl | 
			cl registerQuad: #(#TextMorph #authoringPrototype 'Text' 'Text that you can edit into anything you desire.' ) forFlapNamed: 'PlugIn Supplies'.
			cl registerQuad: #(#TextMorph #exampleBackgroundLabel 'Background Label' 'A piece of text that will occur on every card of the background' ) forFlapNamed: 'Scripting'.
			cl registerQuad: #(#TextMorph #exampleBackgroundField 'Background Field' 'A  data field which will have a different value on every card of the background' ) forFlapNamed: 'Scripting'.
			cl registerQuad: #(#TextMorph #authoringPrototype 'Simple Text' 'Text that you can edit into anything you wish' ) forFlapNamed: 'Stack Tools'.
			cl registerQuad: #(#TextMorph #fancyPrototype 'Fancy Text' 'A text field with a rounded shadowed border, with a fancy font.' ) forFlapNamed: 'Stack Tools'.
			cl registerQuad: #(#TextMorph #authoringPrototype 'Text' 'Text that you can edit into anything you desire.' ) forFlapNamed: 'Supplies']