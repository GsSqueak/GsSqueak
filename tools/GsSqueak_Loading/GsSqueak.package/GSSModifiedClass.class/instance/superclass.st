accessing
superclass

	^ superclass ifNil: [self realClass superclass
							ifNil: [#nil]
							ifNotNil: [:cls | cls theNonMetaClass name]]