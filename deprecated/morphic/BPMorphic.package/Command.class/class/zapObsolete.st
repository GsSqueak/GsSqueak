class initialization
zapObsolete
	"Command zapObsolete"
	"kill some obsolete stuff still retained by the CompiledMethods in
	change records"
	| _gsSqueakTemp_before _gsSqueakTemp_after _gsSqueakTemp_histories _gsSqueakTemp_lastCmd _gsSqueakTemp_histCount _gsSqueakTemp_lastCount |
	Smalltalk garbageCollect.
	_gsSqueakTemp_before := Command allInstances size.
	_gsSqueakTemp_histories := Association allInstances
				select: [:each | each key == #CommandHistory
						and: [(each value isKindOf: OrderedCollection)
								and: [each value isEmpty not
										and: [each value first isKindOf: Command]]]].
	_gsSqueakTemp_histCount := _gsSqueakTemp_histories size.
	_gsSqueakTemp_lastCmd := Association allInstances
				select: [:each | each key == #LastCommand
						and: [each value isKindOf: Command]].
	_gsSqueakTemp_lastCount := _gsSqueakTemp_lastCmd size.
	_gsSqueakTemp_histories
		do: [:each | each value: OrderedCollection new].
	_gsSqueakTemp_lastCmd
		do: [:each | each value: Command new].
	Smalltalk garbageCollect.
	Smalltalk garbageCollect.
	_gsSqueakTemp_after := Command allInstances size.
	Transcript show: {_gsSqueakTemp_before. _gsSqueakTemp_after. _gsSqueakTemp_histCount. _gsSqueakTemp_histories. _gsSqueakTemp_lastCount. _gsSqueakTemp_lastCmd} printString;
		 cr;
		 cr