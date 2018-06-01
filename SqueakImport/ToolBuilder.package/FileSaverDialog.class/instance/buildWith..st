toolbuilder
buildWith: builder
	"assemble the spec for the saver dialog UI and build the window"

	| window windowSpec |
	windowSpec := self buildWindowWith: builder specs: {
		(self topConstantHeightFrame: self textViewHeight + self viewSpacing
			fromLeft: 0
			width: 1) -> [self buildTextInputWith: builder].
		(self frameOffsetFromTop: self textViewHeight + self viewSpacing
			fromLeft: 0.25
			width: 0.75
			offsetFromBottom: 0) -> [self buildFileListWith: builder].
		(self frameOffsetFromTop: self textViewHeight + self viewSpacing
			fromLeft: 0
			width: 0.25
			offsetFromBottom: 0) -> [self buildDirectoryTreeWith: builder].
	}.
	windowSpec buttons addAll: ( self buildButtonsWith: builder ).
	window := builder build: windowSpec.
	window addKeyboardCaptureFilter: self.
	self changed: #selectedPath.
	self inputText: fileName.
	^window
