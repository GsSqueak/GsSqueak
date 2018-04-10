initialization
createBox: aForm 
	"create a button with a form to be used in the label area"
	| _gsSqueakTemp_box |
	_gsSqueakTemp_box := SystemWindowButton new.
	_gsSqueakTemp_box color: Color transparent;
		 target: self;
		 useSquareCorners;
		 borderWidth: 0;
		 labelGraphic: aForm;
		 extent: self boxExtent.
	^ _gsSqueakTemp_box