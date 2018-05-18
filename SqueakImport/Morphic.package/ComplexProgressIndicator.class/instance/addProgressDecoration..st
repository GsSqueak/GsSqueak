as yet unclassified
addProgressDecoration: extraParam 
	| f m |
	targetMorph ifNil: [^self].
	(extraParam isForm) 
		ifTrue: 
			[targetMorph 
				submorphsDo: [:mm | (mm isSketchMorph) ifTrue: [mm delete]].
			f := Form extent: extraParam extent depth: extraParam depth.
			extraParam displayOn: f.
			m := SketchMorph withForm: f.
			m align: m fullBounds leftCenter
				with: targetMorph fullBounds leftCenter + (2 @ 0).
			targetMorph addMorph: m.
			^self].
	(extraParam isString) 
		ifTrue: 
			[targetMorph 
				submorphsDo: [:mm | (mm isKindOf: StringMorph) ifTrue: [mm delete]].
			m := StringMorph contents: extraParam translated.
			m align: m fullBounds bottomCenter + (0 @ 8)
				with: targetMorph bounds bottomCenter.
			targetMorph addMorph: m.
			^self]