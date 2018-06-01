enumerating
associationsDo: aBlock 
	"Evaluate aBlock for each of the receiver's elements (key/value 
	associations)."

	tally = 0 ifTrue: [ ^self].
	1 to: array size do: [ :index |
		(array at: index) ifNotNil: [ :association |
			association key ifNotNil: [ :key | "Don't let the key go away."
				aBlock value: association ] ] ]