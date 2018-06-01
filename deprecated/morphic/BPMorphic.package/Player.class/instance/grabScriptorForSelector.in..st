misc
grabScriptorForSelector: itsSelector in: aWorld 
	"Grab the scriptor for the given selector and place it in the hand"
	aWorld currentHand
		attachMorph: (self scriptEditorFor: itsSelector)