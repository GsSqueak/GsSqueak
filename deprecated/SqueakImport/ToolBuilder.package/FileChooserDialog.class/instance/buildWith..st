toolbuilder
buildWith: builder
	"assemble the spec for the chooser dialog UI"

	| windowSpec window |
	windowSpec := self buildWindowWith: builder specs: {
		(self frameOffsetFromTop: 0
			fromLeft: 0.25
			width: 0.75
			offsetFromBottom: 0) -> [self buildFileListWith: builder].
		(self frameOffsetFromTop: 0
			fromLeft: 0
			width: 0.25
			offsetFromBottom: 0) -> [self buildDirectoryTreeWith: builder].
	}.
	windowSpec buttons addAll: ( self buildButtonsWith: builder ).
	window := builder build: windowSpec.
	window addKeyboardCaptureFilter: self.
	self changed: #selectedPath.
	^window
