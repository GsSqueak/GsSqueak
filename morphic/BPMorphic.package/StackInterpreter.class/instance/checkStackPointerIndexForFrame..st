frame access
checkStackPointerIndexForFrame: theFP 
	"Version of stackPointerIndexForFrame: that does not depend on
	writing back head frame pointers.
	Used for assertion checking. Safe only in external primitives
	(framePointer valid).
	Answer the 0-based index rel to the given frame.
	(This is what stackPointer used to be before conversion to pointer)"
	"In the StackInterpreter stacks grow down."
	| _gsSqueakTemp_thePage _gsSqueakTemp_theSP |
	theFP = framePointer
		ifTrue: [^ self stackPointerIndexForFrame: theFP WithSP: stackPointer].
	_gsSqueakTemp_thePage := stackPages stackPageFor: theFP.
	_gsSqueakTemp_theSP := self
				findSPOrNilOf: theFP
				on: _gsSqueakTemp_thePage
				startingFrom: (_gsSqueakTemp_thePage = stackPage
						ifTrue: [framePointer]
						ifFalse: [_gsSqueakTemp_thePage headFP]).
	_gsSqueakTemp_theSP
		ifNil: [^ -1].
	^ self stackPointerIndexForFrame: theFP WithSP: _gsSqueakTemp_theSP