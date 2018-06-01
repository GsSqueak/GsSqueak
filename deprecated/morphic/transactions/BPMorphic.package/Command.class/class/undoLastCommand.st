dog simple ui
undoLastCommand
	| _gsSqueakTemp_w |
	^ (_gsSqueakTemp_w := self currentWorld) == nil
		ifFalse: [_gsSqueakTemp_w commandHistory undoLastCommand]