dog simple ui
redoEnabled
	| w |
	^(w := self currentWorld) == nil ifTrue:[false] ifFalse:[w commandHistory redoEnabled]