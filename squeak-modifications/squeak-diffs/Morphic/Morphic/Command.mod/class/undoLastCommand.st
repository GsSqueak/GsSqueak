dog simple ui
undoLastCommand
	| w |
	^(w := self currentWorld) == nil ifFalse:[w commandHistory undoLastCommand]