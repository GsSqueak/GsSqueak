toolbuilder
buildWith: builder
	"Inspector openOn: SystemOrganization"
	| windowSpec specs buttonOffset |
	buttonOffset := (Preferences standardButtonFont widthOfString: 'explore') * 3/2.
	
	specs := {
		(0@0 corner: 0.3@0.71)  -> [self buildFieldListWith: builder].
		(0.3@0.0corner: 1@0.71) -> [self buildValuePaneWith: builder].
		(LayoutFrame fractions: (0@0.71 corner: 1@1) offsets: (0@0 corner: buttonOffset negated@0)) -> [self buildCodePaneWith: builder].
		(LayoutFrame fractions: (1@0.71 corner: 1@1) offsets: (buttonOffset negated@0 corner: 0 @ 0)) -> [self buildExploreButtonWith: builder]
	}.
	
	windowSpec := self buildWindowWith: builder specs: specs. 
	windowSpec extent: self initialExtent.
	^builder build: windowSpec