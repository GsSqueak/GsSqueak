instance creation
newDuring: aBlock

	| error |
	error := self externalNew.
	aBlock value: error.
	error free