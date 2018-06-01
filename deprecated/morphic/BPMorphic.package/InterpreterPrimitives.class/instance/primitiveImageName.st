other primitives
primitiveImageName
	"When called with a single string argument, record the string as the
	current image file name. When called with zero arguments, return a
	string containing the current image file name."
	| _gsSqueakTemp_s _gsSqueakTemp_sz _gsSqueakTemp_sCRIfn _gsSqueakTemp_okToRename |
	argumentCount = 1
		ifTrue: ["If the security plugin can be loaded, use it to check for
			rename permission.
			If not, assume it's ok"
			_gsSqueakTemp_sCRIfn := self ioLoadFunction: 'secCanRenameImage' From: 'SecurityPlugin'.
			_gsSqueakTemp_sCRIfn ~= 0
				ifTrue: [_gsSqueakTemp_okToRename := self
								cCode: '((sqInt (*)(void))sCRIfn)()'
								inSmalltalk: [self dispatchMappedPluginEntry: _gsSqueakTemp_sCRIfn].
					_gsSqueakTemp_okToRename
						ifFalse: [^ self primitiveFail]].
			_gsSqueakTemp_s := self stackTop.
			self
				assertClassOf: _gsSqueakTemp_s
				is: (objectMemory splObj: ClassByteString).
			self successful
				ifTrue: [_gsSqueakTemp_sz := self stSizeOf: _gsSqueakTemp_s.
					self imageNamePut: _gsSqueakTemp_s + objectMemory baseHeaderSize Length: _gsSqueakTemp_sz.
					self pop: 1]]
		ifFalse: [_gsSqueakTemp_sz := self imageNameSize.
			_gsSqueakTemp_s := objectMemory
						instantiateClass: (objectMemory splObj: ClassByteString)
						indexableSize: _gsSqueakTemp_sz.
			self imageNameGet: _gsSqueakTemp_s + objectMemory baseHeaderSize Length: _gsSqueakTemp_sz.
			self pop: 1 thenPush: _gsSqueakTemp_s]