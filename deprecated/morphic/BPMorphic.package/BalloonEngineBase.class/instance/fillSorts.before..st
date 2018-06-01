FILL processing
fillSorts: fillEntry1 before: fillEntry2 
	"Return true if fillEntry1 should be drawn before fillEntry2"
	| _gsSqueakTemp_diff |
	"First check the depth value"
	_gsSqueakTemp_diff := (self stackFillDepth: fillEntry1)
				- (self stackFillDepth: fillEntry2).
	_gsSqueakTemp_diff = 0
		ifFalse: [^ _gsSqueakTemp_diff > 0].
	"See the class comment for aetScanningProblems"
	^ (self
		cCoerce: (self
				makeUnsignedFrom: (self stackFillValue: fillEntry1))
		to: 'unsigned')
		< (self
				cCoerce: (self
						makeUnsignedFrom: (self stackFillValue: fillEntry2))
				to: 'unsigned')