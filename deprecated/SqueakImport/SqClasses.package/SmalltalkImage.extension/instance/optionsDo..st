*SqClasses-*SqClasses-*SqClasses-command line
optionsDo: aBlock 
	"Enumerate the command-line arguments passed to the vm only.  This does not include arguments passed to the image."
	1
		to: 1000
		by: 1
		do:
			[ : n | 
			(self optionAt: n)
				ifNil: [ ^ self ]
				ifNotNil: [ : opt | aBlock value: opt ] ]
