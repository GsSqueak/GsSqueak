query
allSentMessagesWithout: classesAndMessagesPair 
	"Answer the set of selectors which are sent somewhere in the system,  
	computed in the absence of the supplied classes and messages."
	| sent absentClasses absentSelectors |
	sent := IdentitySet new: CompiledMethod instanceCount.
	absentClasses := classesAndMessagesPair first.
	absentSelectors := classesAndMessagesPair second.
	"sd 29/04/03"
	Cursor execute showWhile: [
		self environment allClassesAndTraitsDo: [:cls |
			((absentClasses includes: cls name)
				ifTrue: [{}]
				ifFalse: [{cls. cls classSide}])
					do: [:each | (absentSelectors isEmpty
						ifTrue: [each selectors]
						ifFalse: [each selectors copyWithoutAll: absentSelectors])
						do: [:sel | "Include all sels, but not if sent by self"
							(each compiledMethodAt: sel) literalsDo: [:m | 
									(m isSymbol)
										ifTrue: ["might be sent"
											m == sel
												ifFalse: [sent add: m]].
									(m isMemberOf: Array)
										ifTrue: ["might be performed"
											m
												do: [:x | (x isSymbol)
														ifTrue: [x == sel
																ifFalse: [sent add: x]]]]]]]]].
	"The following may be sent without being in any literal frame"
	Smalltalk specialSelectorNames do: [:sel | sent add: sel].
	Smalltalk presumedSentMessages	do: [:sel | sent add: sel].
	^ sent.