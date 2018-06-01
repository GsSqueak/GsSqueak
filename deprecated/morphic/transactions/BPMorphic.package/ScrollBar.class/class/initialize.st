class initialization
initialize
	"ScrollBar initialize"
	UpArrow := Form
				extent: 6 @ 3
				fromArray: #(805306368 2013265920 4227858432 )
				offset: 0 @ 0.
	""
	self initializeImagesCache.
	"Adjustments for FaceLift"
	Preferences disable: #scrollBarsNarrow.
	SystemWindow
		allSubInstancesDo: [:w | w updatePaneColors].
	ScrollPane
		allSubInstancesDo: [:pane | pane hideOrShowScrollBars]