reading
readHeader
	"read header for pbm, pgm or ppm"
	| tokens aux d c  |
	tokens := OrderedCollection new.
	aux := self getTokenPbm: tokens.
	cols := aux at: 1. tokens := aux at: 2.
	aux := self getTokenPbm: tokens.
	rows := aux at: 1. tokens := aux at: 2.

	(type = 1 or:[type = 4]) ifTrue:[
		maxValue := 1
	]
	ifFalse: [
		aux := self getTokenPbm: tokens.
		maxValue := aux at: 1. tokens := aux at: 2.
	].
	d := {1 . 2 . 4 . 	8 . 		16 . 32}.
	c := {2 . 4 . 16 . 256 . 32768 . 16777216}. 
	(type = 3 or:[type = 6]) ifTrue: [
		maxValue >= 65536 ifTrue:[
			self error:'Pixmap > 48 bits not supported in PPM'
		].
		maxValue >= 256 ifTrue:[
			self error:'Pixmap > 32 bits are not supported in Squeak'
		].
		maxValue < 32 ifTrue:[depth := 16] ifFalse:[depth := 32].
	]
	ifFalse: [
		depth := nil.
		1 to: c size do:[:i| ((c at: i) > maxValue and:[depth = nil]) ifTrue:[depth:=d at: i]].
	].
	Transcript cr; show: 'PBM file class ', type asString, ' size ', cols asString, ' x ', 
		rows asString, ' maxValue =', maxValue asString, ' depth=', depth asString.
