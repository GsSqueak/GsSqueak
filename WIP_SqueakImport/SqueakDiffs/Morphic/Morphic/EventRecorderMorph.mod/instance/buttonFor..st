initialization
buttonFor: data 

	| b |
	b := SimpleButtonMorph new 
		target: self;
		label: data first asString translated;
		actionSelector: data first.
	data second ifNotNil: [b width < data second ifTrue: [b width: data second]].
	data third ifNotNil: [b setBalloonText: data third translated].
	^b