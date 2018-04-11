actions
colorable
	"Return true if the current tool uses a color."
	^ (#(#erase: #eyedropper: #pickup: #stamp: ) indexOf: action)
		= 0"These use no color"
	"fill: does"