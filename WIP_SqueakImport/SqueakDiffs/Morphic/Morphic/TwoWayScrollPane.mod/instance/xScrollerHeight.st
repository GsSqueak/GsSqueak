retractable scroll bar
xScrollerHeight

	(submorphs includes: xScrollBar)  "Sorry the logic is reversed :( "
		ifFalse: [^ 0 @ 0]					"already included"
		ifTrue: [^ 0 @ xScrollBar height]	"leave space for it"
