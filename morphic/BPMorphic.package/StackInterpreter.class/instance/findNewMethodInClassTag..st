message sending
findNewMethodInClassTag: classTagArg 
	"Find the compiled method to be run when the current 
	messageSelector is sent to the given class, setting the values 
	of 'newMethod' and 'primitiveIndex'."
	| _gsSqueakTemp_ok _gsSqueakTemp_classTag |
	_gsSqueakTemp_ok := self lookupInMethodCacheSel: messageSelector classTag: classTagArg.
	_gsSqueakTemp_ok
		ifFalse: ["entry was not found in the cache; look it up the hard way"
			_gsSqueakTemp_classTag := classTagArg.
			((objectMemory isOopForwarded: messageSelector)
					or: [objectMemory isForwardedClassTag: _gsSqueakTemp_classTag])
				ifTrue: [(objectMemory isOopForwarded: messageSelector)
						ifTrue: [messageSelector := self handleForwardedSelectorFaultFor: messageSelector].
					(objectMemory isForwardedClassTag: _gsSqueakTemp_classTag)
						ifTrue: [_gsSqueakTemp_classTag := self handleForwardedSendFaultForTag: _gsSqueakTemp_classTag].
					_gsSqueakTemp_ok := self lookupInMethodCacheSel: messageSelector classTag: _gsSqueakTemp_classTag.
					_gsSqueakTemp_ok
						ifTrue: [^ nil]].
			lkupClass := objectMemory classForClassTag: _gsSqueakTemp_classTag.
			NewspeakVM
				ifTrue: [self lookupOrdinarySend]
				ifFalse: [self lookupMethodInClass: lkupClass].
			self addNewMethodToCache: lkupClass]