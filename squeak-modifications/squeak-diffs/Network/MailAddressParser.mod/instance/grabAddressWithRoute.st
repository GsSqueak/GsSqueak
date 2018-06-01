parsing
grabAddressWithRoute
	"grad an address of the form 'Descriptive Text <real.address@c.d.e>"
	
	| name |
	self startNewAddress.
	
	tokens removeLast.	"remove the >"

	"grab until we see a $<"
	[ tokens isEmpty ifTrue: [self error: '<> are not matched' ].
	  tokens last type = $<] 
		whileFalse: [ self addToAddress ].

	tokens removeLast.  "remove the <"
	self finishAddress.
	
	name := self grabName.
	
	storeNames ifTrue: [addresses addFirst: {name . addresses removeFirst}].