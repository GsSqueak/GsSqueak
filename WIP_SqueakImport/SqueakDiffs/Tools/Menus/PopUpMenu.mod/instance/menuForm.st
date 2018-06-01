private
menuForm
	"Answer a Form to be displayed for this menu."

	form == nil ifTrue: [self computeForm].
	^ form