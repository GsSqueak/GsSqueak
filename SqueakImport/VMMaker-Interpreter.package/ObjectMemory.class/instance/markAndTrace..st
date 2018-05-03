gc -- mark and sweep
markAndTrace: oop
	"Mark all objects reachable from the given one.
	Trace from the given object even if it is old.
	Do not trace if it is already marked.
	Mark it only if it is a young object."
	"Tracer state variables:
		child		object being examined
		field		next field of child to examine
		parentField	field where child was stored in its referencing object"

	| header lastFieldOffset action statMarkCountLocal |
	header := self longAt: oop.
	(header bitAnd: self markBit) = 0 ifFalse: [^ 0  "already marked"].

	"record tracing status in object's header"
	header := (header bitAnd: self allButTypeMask) bitOr: HeaderTypeGC.
	(self oop: oop isGreaterThanOrEqualTo: youngStart)
		ifTrue: [ header := header bitOr: self markBit ].  "mark only if young"
	self longAt: oop put: header.

	"initialize the tracer state machine"
	parentField := GCTopMarker.
	child := oop.
	(self isWeakNonInt: oop) ifTrue: [
		"Set lastFieldOffset before the weak fields in the receiver"
		lastFieldOffset := (self nonWeakFieldsOf: oop) << self shiftForWord.
		"And remember as weak root"
		weakRootCount := weakRootCount + 1.
		weakRoots at: weakRootCount put: oop.
	] ifFalse: [
		"Do it the usual way"
		lastFieldOffset := self lastPointerOf: oop.
	].
	field := oop + lastFieldOffset.
	action := StartField.
	youngStartLocal := youngStart.
	statMarkCountLocal := statMarkCount.
	"run the tracer state machine until all objects reachable from oop are marked"
	[action = Done] whileFalse: [
		statMarkCountLocal := statMarkCountLocal + 1.
		action = StartField ifTrue: [ action := self startField ].
		action = StartObj ifTrue: [ action := self startObj ].
		action = Upward ifTrue: [ action := self upward ].
	].
	statMarkCount := statMarkCountLocal.