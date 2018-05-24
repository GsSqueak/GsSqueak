toolbuilder
buildWith: builder
	"Create the ui for the browser"
	"ToolBuilder open: self"
	
	| windowSpec |
	windowSpec := self buildWindowWith: builder specs: {
		(self fontListFrame) -> [self buildFontListWith: builder].
		(self previewFrame) -> [self buildPreviewPaneWith: builder].
		(self buttonsFrame) -> [self buildButtonBarWith: builder].
	}.
	^ builder build: windowSpec