private
code: codeIndex type: type
	codeIndex ifNil: [^ type negated].
	(CodeLimits at: type) > codeIndex ifTrue: [
		^ (CodeBases at: type) + codeIndex].
	^ type * 256 + codeIndex