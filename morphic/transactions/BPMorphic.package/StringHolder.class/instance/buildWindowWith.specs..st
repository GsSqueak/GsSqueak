toolbuilder
buildWindowWith: builder specs: specs 
	| _gsSqueakTemp_windowSpec |
	_gsSqueakTemp_windowSpec := self buildWindowWith: builder.
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