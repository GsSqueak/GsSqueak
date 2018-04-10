widgets optional
buildPluggableCodePane: aSpec 
	| _gsSqueakTemp_widget |
	_gsSqueakTemp_widget := super buildPluggableCodePane: aSpec.
	"Override code-specific default properties."
	_gsSqueakTemp_widget wantsWrapBorder: PluggableTextMorph visualWrapBorder.
	_gsSqueakTemp_widget
		wrapFlag: (aSpec softLineWrap
				ifNil: [PluggableTextMorph softLineWrap]).
	^ _gsSqueakTemp_widget