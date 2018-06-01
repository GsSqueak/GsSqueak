magnifying
magnifiedForm
	"Answer the magnified form"
	| srcRect form exclusion magnified |
	srcRect := self sourceRectFrom: self sourcePoint.
	(RecursionLock isNil and: [ self showPointer or: [ srcRect intersects: self bounds ]])
		ifTrue: [RecursionLock := self.
			exclusion := self.
			form := self currentWorld
						patchAt: srcRect
						without: exclusion
						andNothingAbove: false.
			RecursionLock := nil]
		ifFalse: ["cheaper method if the source is not occluded"
			form := Display copy: srcRect].
	"smooth if non-integer scale"
	magnified := form
				magnify: form boundingBox
				by: magnification
				smoothing: (magnification isInteger
						ifTrue: [1]
						ifFalse: [2]).
	"display the pointer rectangle if desired"
	self showPointer
		ifTrue: [magnified
				reverse: (magnified center - (2 @ 2) extent: 4 @ 4)
				fillColor: Color white].
	^ magnified