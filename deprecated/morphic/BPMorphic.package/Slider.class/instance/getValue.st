model access
getValue
	"Updates internal value with model data if possible. Returns the
	updated value or the current one."
	self getValueSelector
		ifNotNil: [:selector | self
				value: (model perform: selector)].
	^ self value