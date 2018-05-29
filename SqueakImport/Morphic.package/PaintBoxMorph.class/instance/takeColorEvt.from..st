actions
takeColorEvt: evt from: colorPicker
	"Accept a new color from the colorMemory.  Programs use currentColor: instead.  Do not do this before the picker has a chance to set its own color!"
	^self takeColor: colorPicker currentColor event: evt