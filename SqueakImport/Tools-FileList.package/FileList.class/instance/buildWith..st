toolbuilder
buildWith: builder
	"FileList open"
	| windowSpec window |
	windowSpec := self buildWindowWith: builder specs: {
		(self topConstantHeightFrame: self pathAndPatternHeight
			fromLeft: 0
			width: 1) -> [self buildPatternInputWith: builder].
		(self frameOffsetFromTop: self pathAndPatternHeight
			fromLeft: 0.25
			width: 0.75
			bottomFraction: 0.5) -> [self buildFileListWith: builder].
		(self frameOffsetFromTop: self pathAndPatternHeight
			fromLeft: 0
			width: 0.25
			bottomFraction: 1) -> [self buildDirectoryTreeWith: builder].
		(0.25@0.5 corner: 1@1) -> [self buildContentPaneWith: builder].
	}.
	window := builder build: windowSpec.
	self changed: #selectedPath.
	^window