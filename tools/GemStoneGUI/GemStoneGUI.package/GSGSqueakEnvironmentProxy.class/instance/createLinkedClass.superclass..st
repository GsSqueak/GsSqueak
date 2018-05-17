interface 2
createLinkedClass: aName superclass: aSuperclass
	
	| query |
	
	query := '
	SqueakEnvironment at: {1} put: {1}
	'