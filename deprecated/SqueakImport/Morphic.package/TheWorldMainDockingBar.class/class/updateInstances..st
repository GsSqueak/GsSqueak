events
updateInstances: anEvent 
	"The class has changed, time to update the instances"
	(anEvent itemClass == self
			or: [anEvent itemClass == self class])
		ifFalse: [^ self].
	""
	self updateInstances