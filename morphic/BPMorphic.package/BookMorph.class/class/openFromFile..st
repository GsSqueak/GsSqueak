fileIn/Out
openFromFile: fullName 
	"Reconstitute a Morph from the selected file, presumed to be represent
	a Morph saved via the SmartRefStream mechanism, and open it in an
	appropriate Morphic world"
	| _gsSqueakTemp_book _gsSqueakTemp_aFileStream |
	Smalltalk verifyMorphicAvailability
		ifFalse: [^ self].
	_gsSqueakTemp_aFileStream := FileStream readOnlyFileNamed: fullName.
	_gsSqueakTemp_book := BookMorph new.
	_gsSqueakTemp_book setProperty: #url toValue: _gsSqueakTemp_aFileStream url.
	_gsSqueakTemp_book fromRemoteStream: _gsSqueakTemp_aFileStream.
	_gsSqueakTemp_aFileStream close.
	Smalltalk isMorphic
		ifTrue: [ActiveWorld addMorphsAndModel: _gsSqueakTemp_book]
		ifFalse: [_gsSqueakTemp_book isMorph
				ifFalse: [^ self inform: 'Can only load a single morph
into an mvc project via this mechanism.' translated].
			_gsSqueakTemp_book openInWorld].
	_gsSqueakTemp_book goToPage: 1