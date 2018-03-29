debug printing
printFrame: theFP 
	| _gsSqueakTemp_thePage _gsSqueakTemp_frameAbove _gsSqueakTemp_theSP |
	(stackPages couldBeFramePointer: theFP)
		ifFalse: [((objectMemory addressCouldBeObj: theFP asInteger)
					and: [(objectMemory isInMemory: theFP asInteger)
							and: [(objectMemory isContextNonImm: theFP asInteger)
									and: [self checkIsStillMarriedContext: theFP asInteger currentFP: framePointer]]])
				ifTrue: [^ self
						printFrame: (self frameOfMarriedContext: theFP asInteger)].
			self printHexPtr: theFP;
				 print: ' is not in the stack zone?!';
				 cr.
			^ nil].
	_gsSqueakTemp_frameAbove := nil.
	theFP = framePointer
		ifTrue: [_gsSqueakTemp_theSP := stackPointer]
		ifFalse: [_gsSqueakTemp_thePage := stackPages stackPageFor: theFP.
			(stackPages isFree: _gsSqueakTemp_thePage)
				ifTrue: [self printHexPtr: theFP;
						 print: ' is on a free page?!';
						 cr.
					^ nil].
			(_gsSqueakTemp_thePage ~= stackPage
					and: [theFP = _gsSqueakTemp_thePage headFP])
				ifTrue: [_gsSqueakTemp_theSP := _gsSqueakTemp_thePage headSP]
				ifFalse: [_gsSqueakTemp_frameAbove := self
								safeFindFrameAbove: theFP
								on: _gsSqueakTemp_thePage
								startingFrom: ((_gsSqueakTemp_thePage = stackPage
											and: [framePointer between: _gsSqueakTemp_thePage realStackLimit and: _gsSqueakTemp_thePage baseAddress])
										ifTrue: [framePointer]
										ifFalse: [_gsSqueakTemp_thePage headFP]).
					_gsSqueakTemp_theSP := _gsSqueakTemp_frameAbove
								ifNotNil: [self frameCallerSP: _gsSqueakTemp_frameAbove]]].
	_gsSqueakTemp_theSP
		ifNil: [self print: 'could not find sp; using bogus value';
				 cr.
			_gsSqueakTemp_theSP := self frameReceiverLocation: theFP].
	self printFrame: theFP WithSP: _gsSqueakTemp_theSP.
	_gsSqueakTemp_frameAbove
		ifNotNil: [self printFrameThing: 'frame pc' at: _gsSqueakTemp_frameAbove + FoxCallerSavedIP]