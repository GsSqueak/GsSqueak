parts bin
fancyPrototype

	| t |
	t := self authoringPrototype.
	t autoFit: false; extent: 150@75.
	t borderWidth: 2; margins: 4@0; useRoundedCorners.	"Why not rounded?"
	"fancy font, shadow, rounded"
	t fontName: Preferences standardEToysFont familyName size: 18; textColor: Color blue; fillStyle: Color lightBrown.
	t addDropShadow.

"Strangeness here in order to avoid two offset copies of the default contents when operating in an mvc project before cursor enters the morphic window"
	t paragraph.
	^ t