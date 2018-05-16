shrinking
abandonSources
	"Smalltalk abandonSources"
	"Replaces every method by a copy with the 4-byte source pointer 
	 replaced by a string of all arg and temp names, followed by its
	 length. These names can then be used to inform the decompiler."
	"wod 11/3/1998: zap the organization before rather than after
	 condensing changes."
	"eem 7/1/2009 13:59 update for the closure schematic temp names regime"
	| oldMethods newMethods bTotal bCount |
	(self confirm: 'This method will preserve most temp names
(up to about 15k characters of temporaries)
while allowing the sources file to be discarded.
-- CAUTION --
If you have backed up your system and
are prepared to face the consequences of
abandoning source code files, choose Yes.
If you have any doubts, you may choose No
to back out with no harm done.')
			== true
		ifFalse: [^ self inform: 'Okay - no harm done'].
	oldMethods := OrderedCollection new: CompiledMethod instanceCount.
	newMethods := OrderedCollection new: CompiledMethod instanceCount.
	bTotal := 0.
	bCount := 0.
	self systemNavigation allBehaviorsDo: [:b | bTotal := bTotal + 1].
	'Saving temp names for better decompilation...'
		displayProgressFrom: 0
		to: bTotal
		during:
			[:bar |
			self systemNavigation allBehaviorsDo:
				[:cl |  "for test: (Array with: Arc with: Arc class) do:"
				bar value: (bCount := bCount + 1).
				cl selectorsAndMethodsDo:
					[:selector :m |
					| oldCodeString methodNode |
					m fileIndex > 0 ifTrue:
						[oldCodeString := cl sourceCodeAt: selector.
						methodNode := cl newCompiler
											parse: oldCodeString
											in: cl
											notifying: nil.
						oldMethods addLast: m.
						newMethods addLast: (m copyWithTempsFromMethodNode: methodNode)]]]].
	oldMethods asArray elementsExchangeIdentityWith: newMethods asArray.
	self systemNavigation allBehaviorsDo: [:b | b zapOrganization].
	self condenseChanges.
	Preferences disable: #warnIfNoSourcesFile