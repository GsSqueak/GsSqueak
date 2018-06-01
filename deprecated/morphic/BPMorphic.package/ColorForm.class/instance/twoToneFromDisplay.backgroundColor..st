color manipulation
twoToneFromDisplay: aRectangle backgroundColor: bgColor 
	"Copy one-bit deep ColorForm from the Display using a color map that
	maps all colors except the background color to black. Used for
	caching the contents of inactive MVC windows."
	| _gsSqueakTemp_map |
	(width = aRectangle width
			and: [height = aRectangle height])
		ifFalse: [self setExtent: aRectangle extent depth: depth].
	"make a color map mapping the background color
	to zero and all other colors to one"
	_gsSqueakTemp_map := Bitmap
				new: (1
						bitShift: (Display depth min: 9)).
	1
		to: _gsSqueakTemp_map size
		do: [:i | _gsSqueakTemp_map at: i put: 4294967295].
	_gsSqueakTemp_map
		at: (bgColor indexInMap: _gsSqueakTemp_map)
		put: 0.
	(BitBlt toForm: self) destOrigin: 0 @ 0;
		 sourceForm: Display;
		 sourceRect: aRectangle;
		 combinationRule: Form over;
		 colorMap: _gsSqueakTemp_map;
		 copyBits