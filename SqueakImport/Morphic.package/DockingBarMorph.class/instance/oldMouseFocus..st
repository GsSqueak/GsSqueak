events
oldMouseFocus: aMorph
	
	(self submorphs includes: aMorph) 
		ifFalse: [ oldMouseFocus := aMorph ]
		ifTrue: [ oldMouseFocus := nil ]
	