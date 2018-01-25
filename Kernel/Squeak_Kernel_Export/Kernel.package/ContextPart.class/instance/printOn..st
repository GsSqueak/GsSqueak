printing
printOn: aStream 
	| method selector class mclass |
	(method := self method) ifNil: [^super printOn: aStream].
	class := self objectClass: self receiver.
	mclass := method methodClass.
	selector := method selector ifNil: [method defaultSelector].
	aStream nextPutAll: class name.
	mclass ~~ class ifTrue:
		[aStream nextPut: $(; nextPutAll: mclass name; nextPut: $)].
	aStream nextPutAll: '>>'; nextPutAll: selector.
	(selector == #doesNotUnderstand:
	 and: [self closure isNil
	 and: [(self objectClass: (self tempAt: 1)) == Message]]) ifTrue:
		[aStream space.
		(self tempAt: 1) selector printOn: aStream]