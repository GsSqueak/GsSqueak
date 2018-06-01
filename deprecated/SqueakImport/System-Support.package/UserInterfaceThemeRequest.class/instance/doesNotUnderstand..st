lookup
doesNotUnderstand: aMessage 
	"Look up the visual-attribute specified by aMessage's #selector in the current theme for the current target object."

	aMessage numArgs = 0 ifTrue: [
		^ (self theme get: self target class -> aMessage selector)
			ifNil: [(self theme respondsTo: aMessage selector)
				ifTrue: [self theme perform: aMessage selector]
				ifFalse: [nil "means unset property"]]].
	
	^ self theme
		perform: aMessage selector
		withArguments: aMessage arguments.