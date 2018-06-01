public access
parser

	parser ifNil: [parser := (cue getClass ifNil: [self class]) newParser].
	^parser