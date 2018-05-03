system primitives
primitiveGetItemMark: menuHandleOop item: anInteger
	| menuHandle aCharacter |
	self primitive: 'primitiveGetItemMark'
		parameters: #(Oop SmallInteger).
	self var: 'menuHandle' type: 'MenuHandle'.
	self var: #aCharacter type: 'CharParameter '.
	self var: #ptr type: 'char *'.
	
	menuHandle := self cCoerce: (interpreterProxy positive32BitValueOf: menuHandleOop) to: 'MenuHandle'.
	(self ioCheckMenuHandle: menuHandle) ifFalse: [^interpreterProxy success: false].
	aCharacter := 0.
	self cCode: 'GetItemMark(menuHandle,anInteger,&aCharacter)' inSmalltalk:[menuHandle].
	^aCharacter asSmallIntegerObj

