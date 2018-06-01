accessing - ui
adoptPaneColor: paneColor

	super adoptPaneColor: paneColor.
	paneColor ifNotNil: [:c | self sliderColor: c].