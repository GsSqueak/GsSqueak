toolbuilder
buildWindowWith: builder specs: specs 
	| _gsSqueakTemp_windowSpec |
	_gsSqueakTemp_windowSpec := builder pluggableWindowSpec new.
	_gsSqueakTemp_windowSpec model: self;
		 label: 'Choose a Font to import' translated;
		 extent: self initialExtent;
		 children: OrderedCollection new.
	specs
		do: [:assoc | 
			| rect action widgetSpec |
			rect := assoc key.
			action := assoc value.
			widgetSpec := action value.
			widgetSpec
				ifNotNil: [widgetSpec frame: rect.
					_gsSqueakTemp_windowSpec children add: widgetSpec]].
	^ _gsSqueakTemp_windowSpec