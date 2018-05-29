objects from disk
storeDataOn: aDataStream
	"Blocks are allowed go to out in DataStreams, but only without home senders."

	| contexts |
	contexts := IdentitySet new.
	aDataStream insideASegment ifFalse:
		[self outerContextsDo:
			[:ctxt|
			 contexts add: ctxt.
			 aDataStream replace: ctxt sender with: nil]].
	^[super storeDataOn: aDataStream]
		on: Notification
		do: [:ex|
			(contexts includes: ex tag)
				ifTrue: [ex resume: ex tag]
				ifFalse: [ex pass]]

