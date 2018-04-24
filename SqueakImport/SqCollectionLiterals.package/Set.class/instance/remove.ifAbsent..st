removing
remove: oldObject ifAbsent: aBlock

	| index |
	index := self scanFor: oldObject.
	(array at: index) ifNil: [ ^ aBlock value ].
	array at: index put: nil.
	tally := tally - 1.
	self fixCollisionsFrom: index.
	^ oldObject