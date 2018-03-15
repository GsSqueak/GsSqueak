widgets optional
buildPluggableDialog: spec 
	| _gsSqueakTemp_windowSpec |
	_gsSqueakTemp_windowSpec := self pluggableWindowSpec new.
	_gsSqueakTemp_windowSpec
		children: (spec children
				ifNil: [OrderedCollection new]).
	"TODO: Convert the dialog's message into some element in the
	children. "
	spec buttons
		ifNotNil: [:buttons | _gsSqueakTemp_windowSpec children addAll: buttons].
	_gsSqueakTemp_windowSpec model: spec model;
		 extent: spec extent;
		 label: spec title.
	^ self buildPluggableWindow: _gsSqueakTemp_windowSpec