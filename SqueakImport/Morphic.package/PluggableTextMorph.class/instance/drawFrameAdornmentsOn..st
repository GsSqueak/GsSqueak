drawing
drawFrameAdornmentsOn: aCanvas 
	"Include a thin red inset border for unaccepted edits, or, if the unaccepted edits are known to conflict with a change made somewhere else to the same method (typically), put a thick red frame"

	self wantsFrameAdornments ifFalse: [^ self].
	
	self readOnly ifTrue: [^ self drawFrameAdornment: (self valueOfProperty: #adornmentReadOnly ifAbsent: [Color black]) on: aCanvas].
	
	(model notNil and: [model refusesToAcceptCode])
		ifTrue: [
			"Put up feedback showing that code cannot be submitted in this state"
			^ self drawFrameAdornment: (self valueOfProperty: #adornmentRefuse ifAbsent: [Color tan]) on: aCanvas].
	
	self hasEditingConflicts
		ifTrue: [^ self drawFrameAdornment: (self valueOfProperty: #adornmentConflict ifAbsent: [Color red]) on: aCanvas].
		 
	self hasUnacceptedEdits ifTrue: [
		model wantsDiffFeedback
			ifTrue: [self drawFrameAdornment: (self valueOfProperty: #adornmentDiffEdit ifAbsent: [Color yellow]) on: aCanvas]
			ifFalse: [self drawFrameAdornment: (self valueOfProperty: #adornmentNormalEdit ifAbsent: [Color orange]) on: aCanvas].
		^ self].

	model wantsDiffFeedback
		ifTrue: [self drawFrameAdornment: (self valueOfProperty: #adornmentDiff ifAbsent: [Color green]) on: aCanvas].