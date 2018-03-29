message sending
lookupMethodInDictionary: dictionary 
	"This method lookup tolerates integers as Dictionary keys to support
	execution of images in which Symbols have been compacted out."
	| _gsSqueakTemp_length _gsSqueakTemp_index _gsSqueakTemp_mask _gsSqueakTemp_wrapAround _gsSqueakTemp_nextSelector _gsSqueakTemp_methodArray |
	_gsSqueakTemp_length := objectMemory numSlotsOf: dictionary.
	_gsSqueakTemp_mask := _gsSqueakTemp_length - SelectorStart - 1.
	"Use linear search on small dictionaries; its cheaper.
	Also the limit can be set to force linear search of all dictionaries, which
	supports the
	booting of images that need rehashing (e.g. because a tracer has
	generated an image
	with different hashes but hasn't rehashed it yet.)"
	_gsSqueakTemp_mask <= methodDictLinearSearchLimit
		ifTrue: [_gsSqueakTemp_index := 0.
			[_gsSqueakTemp_index <= _gsSqueakTemp_mask]
				whileTrue: [_gsSqueakTemp_nextSelector := objectMemory fetchPointer: _gsSqueakTemp_index + SelectorStart ofObject: dictionary.
					(objectMemory isOopForwarded: _gsSqueakTemp_nextSelector)
						ifTrue: [_gsSqueakTemp_nextSelector := objectMemory
										fixFollowedField: _gsSqueakTemp_index + SelectorStart
										ofObject: dictionary
										withInitialValue: _gsSqueakTemp_nextSelector].
					_gsSqueakTemp_nextSelector = messageSelector
						ifTrue: [_gsSqueakTemp_methodArray := objectMemory followObjField: MethodArrayIndex ofObject: dictionary.
							newMethod := objectMemory followField: _gsSqueakTemp_index ofObject: _gsSqueakTemp_methodArray.
							^ true].
					_gsSqueakTemp_index := _gsSqueakTemp_index + 1].
			^ false"for Slang"].
	_gsSqueakTemp_index := SelectorStart
				+ (objectMemory methodDictionaryHash: messageSelector mask: _gsSqueakTemp_mask).
	"It is assumed that there are some nils in this dictionary, and search
	will 
	stop when one is encountered. However, if there are no nils, then
	wrapAround 
	will be detected the second time the loop gets to the end of the table."
	_gsSqueakTemp_wrapAround := false.
	[true]
		whileTrue: [_gsSqueakTemp_nextSelector := objectMemory fetchPointer: _gsSqueakTemp_index ofObject: dictionary.
			_gsSqueakTemp_nextSelector = objectMemory nilObject
				ifTrue: [^ false"for Slang"].
			(objectMemory isOopForwarded: _gsSqueakTemp_nextSelector)
				ifTrue: [_gsSqueakTemp_nextSelector := objectMemory
								fixFollowedField: _gsSqueakTemp_index + SelectorStart
								ofObject: dictionary
								withInitialValue: _gsSqueakTemp_nextSelector].
			_gsSqueakTemp_nextSelector = messageSelector
				ifTrue: [_gsSqueakTemp_methodArray := objectMemory followObjField: MethodArrayIndex ofObject: dictionary.
					newMethod := objectMemory followField: _gsSqueakTemp_index - SelectorStart ofObject: _gsSqueakTemp_methodArray.
					^ true].
			_gsSqueakTemp_index := _gsSqueakTemp_index + 1.
			_gsSqueakTemp_index = _gsSqueakTemp_length
				ifTrue: [_gsSqueakTemp_wrapAround
						ifTrue: [^ false"for Slang"].
					_gsSqueakTemp_wrapAround := true.
					_gsSqueakTemp_index := SelectorStart]].
	^ false"for Slang"