drawing-support
preserveStateDuring: aBlock
	"Preserve the full canvas state during the execution of aBlock.
	Note: This does *not* include the state in the receiver (e.g., foundMorph)."
	| tempCanvas result |
	tempCanvas := self copy.
	result := aBlock value: tempCanvas.
	foundMorph := tempCanvas foundMorph.
	^result