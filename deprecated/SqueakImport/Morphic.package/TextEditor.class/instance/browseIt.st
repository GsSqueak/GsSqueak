menu messages
browseIt
	"Launch a browser for the current selection, if appropriate"

	| aSymbol anEntry maybeBrowseInstVar |

	Preferences alternativeBrowseIt ifTrue: [^ self browseClassFromIt].

	self lineSelectAndEmptyCheck: [^ self].

	maybeBrowseInstVar := [ | selectionString |
		selectionString := self selection asString.
		 ([model selectedClass] on: Error do: [:ex|]) ifNotNil:
			[:class|
			(class allInstVarNames includes: selectionString) ifTrue:
				[self systemNavigation
					browseAllAccessesTo: selectionString
					from: (class classThatDefinesInstanceVariable: selectionString).
				 ^nil]]].

	(aSymbol := self selectedSymbol) ifNil:
		[maybeBrowseInstVar value.
		 ^morph flash].

	aSymbol first isUppercase
		ifTrue:
			[anEntry := (model environment
				valueOf: aSymbol
				ifAbsent:
					[ ([model selectedClass] on: Error do: [:ex|]) ifNotNil:
						[:class|
						(class bindingOf: aSymbol) ifNotNil: "e.g. a class var"
							[:binding|
							self systemNavigation browseAllCallsOn: binding.
							^ nil]].
					self systemNavigation browseAllImplementorsOf: aSymbol.
					^ nil]).
			anEntry ifNil: [^ morph flash].
			(anEntry isBehavior and: [anEntry name == aSymbol]) ifFalse: "When is this ever false?"
				[anEntry := anEntry class].
			self systemNavigation browseClass: anEntry]
		ifFalse:
			[self systemNavigation browseAllImplementorsOf: aSymbol.
			 maybeBrowseInstVar value]