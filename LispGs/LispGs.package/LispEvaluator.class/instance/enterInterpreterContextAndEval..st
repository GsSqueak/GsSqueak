entry points
enterInterpreterContextAndEval: anObject 
	"IMPORTANT: 
	
	all entry points to the Lisp interpreter must call this method, which
	simply wraps an #eval: call. 
	
	this method should never be invoked by lisp primitives, since it is
	always considered as the topmost context of a Lisp interpreter. 
	
	the correct behavior of continuations depends on these rules being
	followed. see LKContinuation>>#getTopSenderFrom:
	
	the correct behavior of tail call optimization also depends on this. see
	#inTail: senders
	"
	| val |
	(anObject isConsCell and: [#(#progn: #progn #begin) pointsTo: anObject car])
		ifFalse: [ ^ self evalSemaphore critical: [self evalTailObject: anObject]].
	(anObject cdr ifNil: [^ nil])
		do: [:ea | val := self enterInterpreterContextAndEval: ea].
	^ val
