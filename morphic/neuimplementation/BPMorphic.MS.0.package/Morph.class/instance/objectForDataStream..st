objects from disk
objectForDataStream: refStrm 
	"I am being written out on an object file"
	| dp |
	self sqkPage
		ifNotNil: [refStrm rootObject == self | (refStrm rootObject == self sqkPage)
				ifFalse: [self url notEmpty
						ifTrue: [dp := self sqkPage copyForSaving.
							"be careful touching this object!"
							refStrm replace: self with: dp.
							^ dp]]].
	self prepareToBeSaved
	"Amen"