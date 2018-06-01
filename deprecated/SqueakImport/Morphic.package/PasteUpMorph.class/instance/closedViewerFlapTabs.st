misc
closedViewerFlapTabs
	"Answer all the viewer flap tabs in receiver that are closed"

	^ self submorphs select:
		[:m | (m isKindOf: ViewerFlapTab) and: [m flapShowing not]]