panes
addMorph: aMorph fullFrame: aLayoutFrame
	"Add aMorph according to aLayoutFrame."

	super addMorph: aMorph fullFrame: aLayoutFrame.

	paneMorphs := paneMorphs copyReplaceFrom: 1 to: 0 with: (Array with: aMorph).
	aMorph isImageMorph ifFalse: [aMorph adoptPaneColor: self paneColor].