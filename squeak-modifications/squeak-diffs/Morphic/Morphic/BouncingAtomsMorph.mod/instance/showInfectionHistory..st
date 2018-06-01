other
showInfectionHistory: evt
	"Place a graph of the infection history in the world."

	| graph |
	infectionHistory isEmpty ifTrue: [^ self].
	graph := GraphMorph new data: infectionHistory.
	graph extent: ((infectionHistory size + (2 * graph borderWidth) + 5)@(infectionHistory last max: 50)).
	evt hand attachMorph: graph.
