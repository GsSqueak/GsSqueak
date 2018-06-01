adding
addAllFirst: aCollection 
	"Add all elements of aCollection to the beginning of the me. Answer aCollection. Use double dispatch to add elements in reverse order if aCollection implements #reverseDo:."

	^aCollection addAllFirstTo: self