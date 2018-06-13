oop access
decodeOop: anOop ifFail: failBlock

	| tag |
	tag := self tagForOop: anOop.
	tag = self oopTagSpecial ifTrue: [
		^ self specialFromOop: anOop ifFail: [self error: 'Malformed oop']].
	tag = self oopTagSmallInteger ifTrue: [
		^ self smallIntegerFromOop: anOop ifFail: [self error: 'Malformed oop']].
	tag = self oopTagSmallDouble ifTrue: [
		^ self floatFromOop: anOop ifFail: [self error: 'Malformed oop']].
	^ failBlock value