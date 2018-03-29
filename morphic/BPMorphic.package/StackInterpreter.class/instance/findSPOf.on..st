frame access
findSPOf: theFP on: thePage 
	"Search for the stack pointer for theFP. This points to the hottest item
	on the frame's stack.
	DO NOT CALL THIS WITH theFP == localFP OR theFP ==
	framePointer! "
	| _gsSqueakTemp_theSP |
	self
		deny: (stackPages isFree: thePage).
	_gsSqueakTemp_theSP := self
				findSPOrNilOf: theFP
				on: thePage
				startingFrom: thePage headFP.
	_gsSqueakTemp_theSP
		ifNotNil: [^ _gsSqueakTemp_theSP].
	self error: 'did not find theFP in stack page'.
	^ 0