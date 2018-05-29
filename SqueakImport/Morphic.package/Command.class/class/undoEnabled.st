dog simple ui
undoEnabled
	| w |
	^(w := self currentWorld) == nil ifTrue:[false] ifFalse:[w commandHistory undoEnabled]