as yet unclassified
storeDataOn: aDataStream
	| oldMethod |
	oldMethod := currentMethod.
	currentMethod := nil.
	super storeDataOn: aDataStream.
	currentMethod := oldMethod.
