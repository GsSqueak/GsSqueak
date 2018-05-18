toolbuilder
buildButtonBarWith: builder
	"Build the button bar"
	| panelSpec buttonSpec |
	panelSpec := builder pluggablePanelSpec new.
	panelSpec
		layout: #horizontal;
		children: OrderedCollection new.

	buttonSpec := builder pluggableButtonSpec new.
	buttonSpec 
			model: self;
			label: 'Apply' translated; 
			action: #apply.
	panelSpec children addLast: buttonSpec.


	buttonSpec := builder pluggableButtonSpec new.
	buttonSpec 
			model: self;
			label: 'OK' translated; 
			action: #accept.
	panelSpec children addLast: buttonSpec.

	buttonSpec := builder pluggableButtonSpec new.
	buttonSpec 
			model: self;
			label: 'Cancel' translated; 
			action: #cancel.
	panelSpec children addLast: buttonSpec.

	^panelSpec