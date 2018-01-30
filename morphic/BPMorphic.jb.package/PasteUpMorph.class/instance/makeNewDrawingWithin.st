painting
makeNewDrawingWithin
	"Start a painting session in my interior which will result in a new
	SketchMorph being created as one of my submorphs"
	| evt |
	evt := MouseEvent new
				setType: nil
				position: self center
				buttons: 0
				hand: self world activeHand.
	self makeNewDrawing: evt