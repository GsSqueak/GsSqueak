model access
changeModelSelection: anInteger shifted: shiftedBoolean controlled: controlledBoolean
	"Change the model's selected item index to be anInteger."

	setIndexSelector ifNotNil:
		[ model 
			perform: setIndexSelector 
			with: anInteger
			with: shiftedBoolean
			with: controlledBoolean ]
