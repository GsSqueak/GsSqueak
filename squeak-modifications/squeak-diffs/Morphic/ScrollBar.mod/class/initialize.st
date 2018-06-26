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
	
	"there should be no instances of any of these during GsSqueak bootstrap"
	"SystemWindow allSubInstancesDo:[:w| w updatePaneColors].
	ScrollPane allSubInstancesDo:[:pane| pane hideOrShowScrollBars]."
	
	"Set some settings for GsSqueak"
	GradientScrollBar := false.
	ScrollBarsWithoutMenuButton := true.
	ScrollBarsWithoutArrowButtons := true
