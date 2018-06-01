widgets optional
buildPluggableCodePane: aSpec

	| widget |
	widget := super buildPluggableCodePane: aSpec.
	
	"Override code-specific default properties."
	widget wantsWrapBorder: PluggableTextMorph visualWrapBorder.
	widget wrapFlag: (aSpec softLineWrap ifNil: [PluggableTextMorph softLineWrap]).
	^ widget