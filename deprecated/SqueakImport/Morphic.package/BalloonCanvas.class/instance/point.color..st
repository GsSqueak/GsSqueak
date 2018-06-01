drawing
point: pt color: c
	"Is there any use for this?"
	| myPt |
	transform 
		ifNil:[myPt := pt]
		ifNotNil:[myPt := transform localPointToGlobal: pt].
	^super point: myPt color: c