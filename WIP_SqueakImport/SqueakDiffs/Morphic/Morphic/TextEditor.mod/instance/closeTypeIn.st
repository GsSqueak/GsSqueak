typing support
closeTypeIn
	"See comment in openTypeIn.  It is important to call closeTypeIn before executing
	 any non-typing key, making a new selection, etc.  It is called automatically for
	 menu commands."

	| begin stop |
	beginTypeInIndex ifNotNil: [
		begin := beginTypeInIndex.
		stop := self stopIndex.
				
		self history current
			contentsAfter: (stop <= begin
				ifTrue: [self nullText]
				ifFalse: [paragraph text copyFrom: begin to: stop-1]);
			intervalAfter: (stop to: stop-1);
			intervalBetween: (stop < begin
				ifTrue: [stop to: stop-1]
				ifFalse: [begin to: stop-1]);
			messageToUndo: (Message selector: #undoAndReselect);
			messageToRedo: (Message selector: #redoAndReselect).
			
		self history finishRemember.

		beginTypeInIndex := nil]