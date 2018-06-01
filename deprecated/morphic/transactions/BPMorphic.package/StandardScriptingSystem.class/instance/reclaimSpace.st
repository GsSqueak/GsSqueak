-Etoys-utilities
reclaimSpace
	"Reclaim space from the scripting system, and report the result in an
	informer "
	"ScriptingSystem reclaimSpace"
	| _gsSqueakTemp_reclaimed |
	(_gsSqueakTemp_reclaimed := self spaceReclaimed) > 0
		ifTrue: [self inform: _gsSqueakTemp_reclaimed printString , ' bytes reclaimed']
		ifFalse: [self inform: 'Hmm...  Nothing gained this time.']