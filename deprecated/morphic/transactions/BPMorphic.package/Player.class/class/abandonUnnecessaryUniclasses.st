housekeeping
abandonUnnecessaryUniclasses
	"Player abandonUnnecessaryUniclasses"
	| _gsSqueakTemp_oldCount _gsSqueakTemp_oldFree _gsSqueakTemp_newFree _gsSqueakTemp_newCount _gsSqueakTemp_report |
	_gsSqueakTemp_oldCount := self subclasses size - 1.
	_gsSqueakTemp_oldFree := Smalltalk garbageCollect.
	self allSubInstances
		do: [:aPlayer | aPlayer revertToUnscriptedPlayerIfAppropriate].
	ScriptingSystem spaceReclaimed.
	_gsSqueakTemp_newFree := Smalltalk garbageCollect.
	_gsSqueakTemp_newCount := self subclasses size - 1.
	_gsSqueakTemp_report := 'Before: ' , _gsSqueakTemp_oldCount printString , ' uniclasses, ' , _gsSqueakTemp_oldFree printString , ' bytes free
After:  ' , _gsSqueakTemp_newCount printString , ' uniclasses, ' , _gsSqueakTemp_newFree printString , '
bytes free'.
	Transcript cr; show: 'abandonUnnecessaryUniclasses:'; cr; show: _gsSqueakTemp_report.
	^ _gsSqueakTemp_report