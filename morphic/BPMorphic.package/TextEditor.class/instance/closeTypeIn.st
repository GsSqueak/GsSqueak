typing support
closeTypeIn
	"See comment in openTypeIn. It is important to call closeTypeIn before
	executing any non-typing key, making a new selection, etc. It is
	called automatically for
	menu commands."
	| _gsSqueakTemp_begin _gsSqueakTemp_stop |
	beginTypeInIndex
		ifNotNil: [_gsSqueakTemp_begin := beginTypeInIndex.
			_gsSqueakTemp_stop := self stopIndex.
			self history current
				contentsAfter: (_gsSqueakTemp_stop <= _gsSqueakTemp_begin
						ifTrue: [self nullText]
						ifFalse: [paragraph text copyFrom: _gsSqueakTemp_begin to: _gsSqueakTemp_stop - 1]);
				
				intervalAfter: (_gsSqueakTemp_stop to: _gsSqueakTemp_stop - 1);
				
				intervalBetween: (_gsSqueakTemp_stop < _gsSqueakTemp_begin
						ifTrue: [_gsSqueakTemp_stop to: _gsSqueakTemp_stop - 1]
						ifFalse: [_gsSqueakTemp_begin to: _gsSqueakTemp_stop - 1]);
				
				messageToUndo: (Message selector: #undoAndReselect);
				
				messageToRedo: (Message selector: #redoAndReselect).
			self history finishRemember.
			beginTypeInIndex := nil]