parts bin
borderedPrototype

	| t |
	t := self authoringPrototype.
	t fontName: 'BitstreamVeraSans' pointSize: 24.
	t autoFit: false; extent: 250@100.
	t borderWidth: 1; margins: 4@0; backgroundColor: Color white.

"Strangeness here in order to avoid two offset copies of the default contents when operating in an mvc project before cursor enters the morphic window"
	t paragraph.
	^ t