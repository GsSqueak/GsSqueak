accessing
adoptPaneColor: paneColor 
	super adoptPaneColor: paneColor.
	"May not be in the hierarchy at the moment."
	scrollBar adoptPaneColor: paneColor.
	hScrollBar adoptPaneColor: paneColor.
	paneColor
		ifNotNil: [:c | self
				borderColor: (c adjustBrightness: -0.3)]