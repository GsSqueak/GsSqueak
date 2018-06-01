*SqClasses-copying
copyAllUnobtrusively: selArray from: class classified: cat 
	"Install all the methods found in the method dictionary of the second 
	argument, class, as the receiver's methods. Classify the messages under 
	the third argument, cat."

	selArray do: 
		[:s | self copyUnobtrusively: s
				from: class
				classified: cat]
