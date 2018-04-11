-Tools
revertToPreviousVersion
	"Revert to the previous version of the current method"
	| _gsSqueakTemp_aClass _gsSqueakTemp_aSelector _gsSqueakTemp_changeRecords |
	self okToChange
		ifFalse: [^ self].
	_gsSqueakTemp_aClass := self selectedClassOrMetaClass.
	_gsSqueakTemp_aClass
		ifNil: [^ self changed: #flash].
	_gsSqueakTemp_aSelector := self selectedMessageName.
	_gsSqueakTemp_changeRecords := _gsSqueakTemp_aClass changeRecordsAt: _gsSqueakTemp_aSelector.
	(_gsSqueakTemp_changeRecords == nil
			or: [_gsSqueakTemp_changeRecords size <= 1])
		ifTrue: [self changed: #flash.
			^ Beeper beep].
	_gsSqueakTemp_changeRecords second fileIn.
	self contentsChanged