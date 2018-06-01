toolbuilder
buildButtonBarWith: builder 
	"Build the button bar"
	| _gsSqueakTemp_panelSpec _gsSqueakTemp_buttonSpec |
	_gsSqueakTemp_panelSpec := builder pluggablePanelSpec new.
	_gsSqueakTemp_panelSpec layout: #horizontal;
		 children: OrderedCollection new.
	_gsSqueakTemp_buttonSpec := builder pluggableButtonSpec new model: self;
				 label: 'Import' translated;
				 help: 'Include the font data in the image and provide a TextStyle for the font';
				 action: #import;
				 yourself.
	_gsSqueakTemp_panelSpec children addLast: _gsSqueakTemp_buttonSpec.
	_gsSqueakTemp_buttonSpec := builder pluggableButtonSpec new model: self;
				 label: 'Close' translated;
				 action: #close;
				 yourself.
	_gsSqueakTemp_panelSpec children addLast: _gsSqueakTemp_buttonSpec.
	^ _gsSqueakTemp_panelSpec