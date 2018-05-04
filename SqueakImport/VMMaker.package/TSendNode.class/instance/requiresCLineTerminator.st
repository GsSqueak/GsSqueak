testing
requiresCLineTerminator

	^ (self isComment or: [self isDirective]) not
