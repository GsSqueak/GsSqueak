system introspecting
classFromPattern: pattern withCaption: aCaption 
	"If there is a class or trait whose name exactly given by pattern, return
	it. If there is only one class or trait in the system whose name
	matches pattern, return it.
	Otherwise, put up a menu offering the names of all classes that
	match pattern, and return the class chosen, else nil if nothing
	chosen. This method ignores separator characters in the pattern"
	^ self
		classOrTraitFrom: Smalltalk environment
		pattern: pattern
		label: aCaption"
	self classFromPattern: 'CharRecog' withCaption: ''
	self classFromPattern: 'rRecog' withCaption: ''
	self classFromPattern: 'znak' withCaption: ''
	self classFromPattern: 'orph' withCaption: ''
	self classFromPattern: 'TCompil' withCaption: '
	"