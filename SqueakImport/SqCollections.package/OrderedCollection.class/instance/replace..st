enumerating
replace: aBlock 
	"Evaluate aBlock with each of my elements as the argument. Collect the resulting values into myself.
	Override superclass in order to work on the internal array directly."

	firstIndex to: lastIndex do: [ :index |
		array at: index put: (aBlock value: (array at: index)) ]