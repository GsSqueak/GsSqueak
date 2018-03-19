-Etoys-customevents-scripting
renameScriptActionsFor: aPlayer from: oldSelector to: newSelector 
	self updateableActionMap
		keysAndValuesDo: [:event :sequence | sequence asActionSequence
				do: [:action | (action receiver == aPlayer
							and: [(#(#doScript: #triggerScript: ) includes: action selector)
									and: [action arguments first == oldSelector]])
						ifTrue: [action arguments at: 1 put: newSelector]]]