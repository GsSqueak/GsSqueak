-Etoys-customevents-scripting
removeAllEventTriggersFor: aPlayer 
	"Remove all the event registrations for aPlayer.
	User custom events are triggered at the World,
	while system custom events are triggered on individual Morphs."
	self
		removeActionsSatisfying: [:action | action receiver == aPlayer
				and: [#(#doScript: #triggerScript: ) includes: action selector]]