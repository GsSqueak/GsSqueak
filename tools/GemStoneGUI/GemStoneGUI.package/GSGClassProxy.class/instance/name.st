accessing
name
	
	^ self isMeta
		ifTrue: [name , ' class']
		ifFalse: [name]
