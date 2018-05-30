widgets required
buildPluggableSpacer: spec

	| widget |
	widget := self spacerClass new.
	self register: widget id: spec name.
	
	widget borderWidth: 0.
	widget color: (spec color ifNil: [Color transparent]).
	widget extent: spec extent.

	self buildHelpFor: widget spec: spec. 
	
	self setFrame: spec frame in: widget.
	self setLayoutHintsFor: widget spec: spec.
		
	parent ifNotNil:[self add: widget to: parent].
	^widget