dog simple ui
undoEnabled
	| _gsSqueakTemp_w |
	^ (_gsSqueakTemp_w := self currentWorld) == nil
		ifTrue: [false]
		ifFalse: [_gsSqueakTemp_w commandHistory undoEnabled]