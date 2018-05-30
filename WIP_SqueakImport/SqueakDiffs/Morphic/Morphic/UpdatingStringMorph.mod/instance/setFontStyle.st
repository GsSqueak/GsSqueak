editing
setFontStyle
	| aList reply style |
	aList := (TextConstants select: [:anItem | anItem isKindOf: TextStyle]) 
				keys asArray.
	reply := UIManager default chooseFrom: aList values: aList.
	reply notNil 
		ifTrue: 
			[(style := TextStyle named: reply) ifNil: 
					[Beeper beep.
					^true].
			self font: style defaultFont]