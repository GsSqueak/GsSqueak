-Etoys-scripting
arrowDeltaFor: aGetSelector 
	"Answer a number indicating the default arrow delta to be 
	used in a numeric readout with the given get-selector. This is 
	a hook that subclasses of Morph can reimplement."
	aGetSelector == #getScaleFactor
		ifTrue: [^ 0.1].
	^ 1