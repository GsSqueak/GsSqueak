system primitives
primitiveSetItemCmd: menuHandleOop item: anInteger cmdChar: anIntegerCmdChar
	| menuHandle aCharacter |
	self primitive: 'primitiveSetItemCmd'
		parameters: #(Oop SmallInteger SmallInteger).
	self var: 'menuHandle' type: 'MenuHandle'.
	self var: #aCharacter type: 'CharParameter '.
	
	menuHandle := self cCoerce: (interpreterProxy positive32BitValueOf: menuHandleOop) to: 'MenuHandle'.
	(self ioCheckMenuHandle: menuHandle) ifFalse: [^interpreterProxy success: false].
	aCharacter := anIntegerCmdChar.
	self cCode: 'SetItemCmd(menuHandle,anInteger,aCharacter)' inSmalltalk:[menuHandle].
	^nil

