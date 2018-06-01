toolbuilder
buildWindowWith: builder
	"Since a file chooser is a modal dialog we over-ride the normal window build to use a dialog as the top component"

	| windowSpec |
	windowSpec := builder pluggableDialogSpec new.
	windowSpec model: self;
				label: #windowTitle;
				message: #userMessage;
				extent: self initialExtent;
				spacing: self viewSpacing;
				children: OrderedCollection new;
				buttons: OrderedCollection new.
	^windowSpec