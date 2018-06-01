slots-user
basicRemoveSlotNamed: aSlotName 
	"The user has requested that an instance variable be removed..."
	| _gsSqueakTemp_aSetter _gsSqueakTemp_aGetter |
	(self okayToRemoveSlotNamed: aSlotName)
		ifFalse: [^ self inform: 'Sorry, ' , aSlotName , ' is in
use in a script.'].
	_gsSqueakTemp_aSetter := aSlotName asSetterSelector.
	_gsSqueakTemp_aGetter := aSlotName asGetterSelector.
	((self systemNavigation allCallsOn: _gsSqueakTemp_aSetter) size > 0
			or: [(self systemNavigation allCallsOn: _gsSqueakTemp_aGetter) size > 0])
		ifTrue: [self inform: 'Caution!  There may be scripts belonging to
other objects that may rely on the presence of
this variable.  If there are, they may now be broken.
You may need to fix them up manually.'].
	self class removeInstVarName: aSlotName asString.
	self updateAllViewers