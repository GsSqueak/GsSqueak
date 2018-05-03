system primitives
primitiveSetItemMark: menuHandleOop item: anInteger markChar: aMarkChar
	| menuHandle aCharacter |
	self primitive: 'primitiveSetItemMark'
		parameters: #(Oop SmallInteger SmallInteger).
	self var: 'menuHandle' type: 'MenuHandle'.
	self var: #aCharacter type: 'CharParameter '.
	
	menuHandle := self cCoerce: (interpreterProxy positive32BitValueOf: menuHandleOop) to: 'MenuHandle'.
	(self ioCheckMenuHandle: menuHandle) ifFalse: [^interpreterProxy success: false].
	aCharacter := aMarkChar.
	self cCode: 'SetItemMark(menuHandle,anInteger,aCharacter)' inSmalltalk:[menuHandle].
	^nil

