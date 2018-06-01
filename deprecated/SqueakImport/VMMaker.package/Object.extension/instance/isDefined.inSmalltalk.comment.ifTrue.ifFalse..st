*VMMaker-translation support
isDefined: directiveString inSmalltalk: conditionBlock comment: commentStringOrNil ifTrue: trueExpressionOrBlock ifFalse: falseExpressionOrBlockOrNil
	"When translated, produces #ifdef #else #endif CPP directives.
	Example usage:

	Smalltalk Slang:
		self isDefined: 'HAVE_FOO'
			inSmalltalk: [self isFoo]
			comment: 'some platforms do not support foo properly'
			ifTrue: [self doThingsThatWorkIfFooIsPresent]
			ifFalse: [self doSomethingElseInstead]

	Generated C code:
		# ifdef HAVE_FOO  // some platforms do not support foo properly
			doThingsThatWorkIfFooIsPresent();
		# else
			doSomethingElseInstead();
		# endif  // HAVE_FOO

	Smalltalk Slang:
		hasFoo := self isDefined: 'HAVE_FOO'
					inSmalltalk: [self isFoo]
					comment: 'some platforms do not support foo properly'
					ifTrue: [true]
					ifFalse: [false].

	Generated C code:
		hasFoo =
	# ifdef HAVE_FOO  // some platforms do not support foo properly
			1
	# else
			0
	# endif  // HAVE_FOO
 		;

	"

	^ conditionBlock value
		ifTrue: [trueExpressionOrBlock value]
		ifFalse: [falseExpressionOrBlockOrNil value]
