toolbuilder
buildAnnotationPaneWith: builder
	
	^ builder pluggableInputFieldSpec new
		model: self;
		getText: #annotation;
		yourself