styling
hasUnacceptedEdits: aBoolean
	"re-implemented to re-style the text iff aBoolean is true"
	 
	super hasUnacceptedEdits: aBoolean.
	aBoolean ifTrue: [ self updateStyle ].