layout
widthImposedByOwner
	((owner isNil or: [owner isWorldOrHandMorph]) 
		or: [owner submorphs size < 2]) ifTrue: [^self basicWidth].
	^owner submorphs second width