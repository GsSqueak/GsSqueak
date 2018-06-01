accessing
flatColoredScrollBarLook
	"Currently only show the flat (not rounded) +
	colored-to-match-window scrollbar look when inboard."
	^ retractableScrollBar not
		or: [ScrollBar alwaysShowFlatScrollbarForAlternativeLook]