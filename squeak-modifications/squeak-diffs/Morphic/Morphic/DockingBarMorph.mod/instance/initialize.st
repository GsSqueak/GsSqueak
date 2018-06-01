initialize-release
initialize
	"initialize the receiver"
	super initialize.
	self changeTableLayout.
	
	selectedItem := nil.
	activeSubMenu := nil.
	fillsOwner := true.
	avoidVisibleBordersAtEdge := true.
	autoGradient := MenuMorph gradientMenu.
	self 
		setDefaultParameters ; 
		beFloating ; 
		beSticky ;
		layoutInset: 0 ;
		dropEnabled: true