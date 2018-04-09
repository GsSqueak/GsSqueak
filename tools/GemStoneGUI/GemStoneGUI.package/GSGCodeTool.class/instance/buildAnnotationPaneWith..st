toolbuilder
buildAnnotationPaneWith: builder
	
	| annoSpec |
	annoSpec := builder pluggableInputFieldSpec new.
	annoSpec
		model: self;
		getText: #annotation.
	^ annoSpec