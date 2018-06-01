miscellaneous
instanceComparisonsBetween: fileName1 and: fileName2 
	"For differential results, run printSpaceAnalysis twice with different
	fileNames, then run this method...
	SpaceTally new printSpaceAnalysis: 0 on: 'STspace.text1'.
	--- do something that uses space here ---
	SpaceTally new printSpaceAnalysis: 0 on: 'STspace.text2'.
	Utilities instanceComparisonsBetween: 'STspace.text1' and:
	'STspace.text2' "
	| _gsSqueakTemp_instCountDict _gsSqueakTemp_report _gsSqueakTemp_f _gsSqueakTemp_aString _gsSqueakTemp_items _gsSqueakTemp_className _gsSqueakTemp_newInstCount _gsSqueakTemp_oldInstCount _gsSqueakTemp_newSpace _gsSqueakTemp_oldPair _gsSqueakTemp_oldSpace |
	_gsSqueakTemp_instCountDict := Dictionary new.
	_gsSqueakTemp_report := String new writeStream.
	_gsSqueakTemp_f := FileStream readOnlyFileNamed: fileName1.
	[_gsSqueakTemp_f atEnd]
		whileFalse: [_gsSqueakTemp_aString := _gsSqueakTemp_f nextLine.
			_gsSqueakTemp_items := _gsSqueakTemp_aString findTokens: ' '.
			(_gsSqueakTemp_items size = 4
					or: [_gsSqueakTemp_items size = 5])
				ifTrue: [_gsSqueakTemp_instCountDict
						at: _gsSqueakTemp_items first
						put: (Array with: _gsSqueakTemp_items third asNumber with: _gsSqueakTemp_items fourth asNumber)]].
	_gsSqueakTemp_f close.
	_gsSqueakTemp_f := FileStream readOnlyFileNamed: fileName2.
	[_gsSqueakTemp_f atEnd]
		whileFalse: [_gsSqueakTemp_aString := _gsSqueakTemp_f nextLine.
			_gsSqueakTemp_items := _gsSqueakTemp_aString findTokens: ' '.
			(_gsSqueakTemp_items size = 4
					or: [_gsSqueakTemp_items size = 5])
				ifTrue: [_gsSqueakTemp_className := _gsSqueakTemp_items first.
					_gsSqueakTemp_newInstCount := _gsSqueakTemp_items third asNumber.
					_gsSqueakTemp_newSpace := _gsSqueakTemp_items fourth asNumber.
					_gsSqueakTemp_oldPair := _gsSqueakTemp_instCountDict
								at: _gsSqueakTemp_className
								ifAbsent: [].
					_gsSqueakTemp_oldInstCount := _gsSqueakTemp_oldPair
								ifNil: [0]
								ifNotNil: [_gsSqueakTemp_oldPair first].
					_gsSqueakTemp_oldSpace := _gsSqueakTemp_oldPair
								ifNil: [0]
								ifNotNil: [_gsSqueakTemp_oldPair second].
					_gsSqueakTemp_oldInstCount ~= _gsSqueakTemp_newInstCount
						ifTrue: [_gsSqueakTemp_report nextPutAll: (_gsSqueakTemp_newInstCount - _gsSqueakTemp_oldInstCount) printString;
								 tab;
								 nextPutAll: (_gsSqueakTemp_newSpace - _gsSqueakTemp_oldSpace) printString;
								 tab;
								 nextPutAll: _gsSqueakTemp_className asString;
								 cr]]].
	_gsSqueakTemp_f close.
	(StringHolder new contents: _gsSqueakTemp_report contents)
		openLabel: 'Instance count differentials between ' , fileName1 , ' and ' , fileName2