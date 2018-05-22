toolbuilder
buildButtonBarWith: builder
	"Build the button bar"
	| panelSpec buttonSpec |
	panelSpec := builder pluggablePanelSpec new.
	panelSpec
		layout: #horizontal;
		children: OrderedCollection new.

	buttonSpec := builder pluggableButtonSpec new
			model: self;
			label: 'Import' translated; 
			help: 'Include the font data in the image and provide a TextStyle for the font';
			action: #import;
			yourself.
	panelSpec children addLast: buttonSpec.


	buttonSpec := builder pluggableButtonSpec new
			model: self;
			label: 'Close' translated; 
			action: #close;
			yourself.
	panelSpec children addLast: buttonSpec.


	^panelSpec