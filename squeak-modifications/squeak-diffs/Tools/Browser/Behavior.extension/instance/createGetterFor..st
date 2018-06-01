*Tools-Browser-accessors
createGetterFor: aName

	| code |
	code := '{1}\	\	^ {1}\' withCRs format: {aName.}.
	self compile: code classified: #accessing notifying: nil.