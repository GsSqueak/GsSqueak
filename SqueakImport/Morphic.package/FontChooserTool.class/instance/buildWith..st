toolbuilder
buildWith: builder
	"Create the ui for the browser"
	"ToolBuilder open: self"
	| windowSpec |
	self offerStyleList ifTrue:[
		windowSpec := self buildWindowWith: builder specs: {
			(0@0 corner: 0.4@0.4) -> [self buildFontListWith: builder].
			(0.4@0 corner: 0.8@0.4) -> [self buildStyleListWith: builder].
			(0.8@0 corner: 1.0@0.4) -> [self buildPointSizeListWith: builder].
			(LayoutFrame fractions: (0.0@0.4 corner: 1.0@1.0) offsets: (0@0 corner: 0 @ self buttonHeight negated)) -> [self buildPreviewPaneWith: builder].
			(LayoutFrame fractions: (0@1 corner: 1@1) offsets: (0@ self buttonHeight negated corner: 0@0)) -> [self buildButtonBarWith: builder].
		}.
	] ifFalse:[
		windowSpec := self buildWindowWith: builder specs: {
			(0@0 corner: 0.7@0.4) -> [self buildFontListWith: builder].
"			(0.4@0 corner: 0.8@0.4) -> [self buildStyleListWith: builder]."
			(0.7@0 corner: 1.0@0.4) -> [self buildPointSizeListWith: builder].
			(LayoutFrame fractions: (0.0@0.4 corner: 1.0@1.0) offsets: (0@0 corner: 0 @ self buttonHeight negated)) -> [self buildPreviewPaneWith: builder].
			(LayoutFrame fractions: (0@1 corner: 1@1) offsets: (0@ self buttonHeight negated corner: 0@0)) -> [self buildButtonBarWith: builder].
		}.
	].
	windowSpec extent: self initialExtent.
	window := builder build: windowSpec.

	"Now that the window has been built, notify selection again to scroll it into view."
	self changed: #selectedFontIndex.
	^window