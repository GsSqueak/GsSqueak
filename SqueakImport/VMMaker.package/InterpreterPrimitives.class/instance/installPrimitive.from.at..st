primitive table
installPrimitive: selector from: moduleName at: anInteger
	"The primitive table is normally initialized at compile time. This allows an entry
	in the table to be istalled at runtime. If the function cannot be loaded from the
	named module, then let the numbered primitive fail."

	<inline: false> "for readability"
	<var: 'selector' type: 'void *'>
	<var: 'moduleName' type: 'void *'>
	<var: 'fn' declareC: 'void (*fn)(void)'>
	| fn |
	fn := self ioLoadFunction: selector From: moduleName.
	fn = nil
		ifTrue: [ primitiveTable at: anInteger put: #primitiveFail ]
		ifFalse: [ primitiveTable at: anInteger put: fn ].
