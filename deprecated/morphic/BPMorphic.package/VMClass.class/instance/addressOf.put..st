translation support
addressOf: anObject put: aBlock 
	"Simulate a C pointer. Translates into &anObject in C. Provides
	something that evaluates aBlock with the new value in response to
	at:put: "
	| _gsSqueakTemp_thing |
	_gsSqueakTemp_thing := anObject.
	^ CPluggableAccessor new setObject: nil;
		
		atBlock: [:obj :idx | _gsSqueakTemp_thing]
		atPutBlock: [:obj :idx :val | aBlock value: (_gsSqueakTemp_thing := val)]