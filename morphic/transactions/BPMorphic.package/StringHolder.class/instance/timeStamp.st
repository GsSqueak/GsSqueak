-Tools
timeStamp
	"Answer the time stamp for the chosen class and method, if any, else
	an empty string"
	| _gsSqueakTemp_aMethod |
	self selectedMessageName
		ifNotNil: [:_gsSqueakTemp_selector | self selectedClassOrMetaClass
				ifNil: [^ String new]
				ifNotNil: [_gsSqueakTemp_aMethod := self selectedClassOrMetaClass
								compiledMethodAt: _gsSqueakTemp_selector
								ifAbsent: [].
					_gsSqueakTemp_aMethod
						ifNotNil: [^ _gsSqueakTemp_aMethod timeStamp]]].
	^ String new