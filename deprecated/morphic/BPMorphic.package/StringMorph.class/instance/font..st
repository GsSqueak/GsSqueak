printing
font: aFont 
	"Set the font my text will use. The emphasis remains unchanged."
	aFont = font
		ifTrue: [^ self].
	^ self font: aFont emphasis: emphasis