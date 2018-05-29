*Morphic-MorphicExtras-copying
updateReferencesUsing: aDictionary 
	"Update intra-morph references within a composite morph that  
	has been copied. For example, if a button refers to morph X in  
	the orginal  
	composite then the copy of that button in the new composite  
	should refer to  
	the copy of X in new composite, not the original X. This default  
	implementation updates the contents of any morph-bearing slot."

	| old |
	eventHandler isNil 
		ifFalse: 
			[self eventHandler: self eventHandler copy.
			1 to: self eventHandler class instSize
				do: 
					[:i | 
					old := eventHandler instVarAt: i.
					old isMorph 
						ifTrue: [eventHandler instVarAt: i put: (aDictionary at: old ifAbsent: [old])]]].
	otherProperties ifNotNil: [otherProperties associationsDo:  [:assn | 
					assn value: (aDictionary at: assn value ifAbsent: [assn value])]]