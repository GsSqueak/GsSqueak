page controls
indexForPageControls
	"Answer which submorph should hold the page controls"
	^ (submorphs size > 0
			and: [submorphs first hasProperty: #header])
		ifTrue: [2]
		ifFalse: [1]