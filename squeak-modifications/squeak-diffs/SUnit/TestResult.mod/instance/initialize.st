initialization
initialize
	super initialize.
	passed := OrderedCollection new.
	failures := Set new.
	errors := OrderedCollection new.
	timeStamp := 0 "TimeStamp now"
