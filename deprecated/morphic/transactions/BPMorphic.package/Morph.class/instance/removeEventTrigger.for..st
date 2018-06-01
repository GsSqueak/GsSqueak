-Etoys-customevents-scripting
removeEventTrigger: aSymbol for: aPlayer 
	"Remove all the event registrations for aPlayer that are triggered by 
	aSymbol. User custom events are triggered at the World, 
	while system custom events are triggered on individual Morphs."
	self
		removeActionsSatisfying: [:action | action receiver == aPlayer
				and: [(#(#doScript: #triggerScript: ) includes: action selector)
						and: [action arguments first == aSymbol]]]