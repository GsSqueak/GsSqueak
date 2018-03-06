compiled method support
markerOrNilFor: aMethod 
	"If aMethod is a marker method, answer the symbol used to mark it.
	Otherwise answer nil. What is a marker method? It is method with
	body like 
	'self subclassResponsibility' or '^ self subclassResponsibility' 
	used to indicate ('mark') a special property.
	
	Marker methods compile to two bytecode forms, this:
	self
	send: <literal 1>
	pop
	returnSelf
	or this:
	self
	send: <literal 1>
	returnTop"
	^ self subclassResponsibility