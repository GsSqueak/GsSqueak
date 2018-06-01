query
allMethodsWithSourceString: aString matchCase: caseSensitive
	"Answer a sorted collection of all the methods that contain, in source code, aString as a substring. Search the class comments also"

	| result |
	result := OrderedCollection new.
	CurrentReadOnlySourceFiles cacheDuring: [
		'Searching all source code...'
			displayProgressFrom: 0 to: Smalltalk classNames size
			during: [ :bar |
				| count previousBehavior |
				count := 0.
				previousBehavior := nil.
				self allSelectorsAndMethodsDo: [ :behavior :selector :method |
					behavior == previousBehavior ifFalse: [
						bar value: (count := count + 1).
						previousBehavior := behavior.
						(behavior organization classComment asString
							includesSubstring: aString
							caseSensitive: caseSensitive) ifTrue: [
								result add: (MethodReference class: behavior selector: #Comment) ] ].
					(method getSource asString
						includesSubstring: aString
						caseSensitive: caseSensitive) ifTrue: [
							result add: (MethodReference class: behavior selector: selector) ] ] ] ].
	^result sort