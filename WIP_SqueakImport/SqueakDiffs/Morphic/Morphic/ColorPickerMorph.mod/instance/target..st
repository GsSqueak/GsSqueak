accessing
target: anObject 
	target := anObject.
	selectedColor := (target respondsTo: #color)  
				ifTrue: [target color]
				ifFalse: [Color white]