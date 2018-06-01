toolbuilder
buildWith: builder 
	"FileList open"
	| _gsSqueakTemp_windowSpec _gsSqueakTemp_window |
	_gsSqueakTemp_windowSpec := self buildWindowWith: builder specs: {(self
					topConstantHeightFrame: self pathAndPatternHeight
					fromLeft: 0
					width: 1)
					-> [self buildPatternInputWith: builder]. (self
					frameOffsetFromTop: self pathAndPatternHeight
					fromLeft: 0.25
					width: 0.75
					bottomFraction: 0.5)
					-> [self buildFileListWith: builder]. (self
					frameOffsetFromTop: self pathAndPatternHeight
					fromLeft: 0
					width: 0.25
					bottomFraction: 1)
					-> [self buildDirectoryTreeWith: builder]. (0.25 @ 0.5 corner: 1 @ 1)
					-> [self buildContentPaneWith: builder]}.
	_gsSqueakTemp_window := builder build: _gsSqueakTemp_windowSpec.
	self changed: #selectedPath.
	^ _gsSqueakTemp_window