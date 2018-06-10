instance creation
fromClass: oldClass to: newClass

	^ self
		from: (oldClass ifNotNil: [:cls | cls properties])
		to: (newClass ifNotNil: [:cls | cls properties])