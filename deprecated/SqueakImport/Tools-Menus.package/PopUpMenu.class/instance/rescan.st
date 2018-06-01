private
rescan
	"Cause my form to be recomputed after a font change."

	labelString == nil ifTrue: [labelString := 'NoText!'].
	self labels: labelString font: (MenuStyle fontAt: 1) lines: lineArray.
	frame := marker := form := nil.

	"PopUpMenu allSubInstancesDo: [:m | m rescan]"