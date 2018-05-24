initialization
createBox: aForm
	"create a button with a form to be used in the label area"
	
	| box |
	box := SystemWindowButton new.
	box color: Color transparent;
		 target: self;
		 useSquareCorners;
		 borderWidth: 0;
		 labelGraphic: aForm;
		 extent: self boxExtent.
	^ box