model access
changeModelSelection: anInteger
	"Change the model's selected item index to be anInteger."

	^self
		changeModelSelection: anInteger
		shifted: Sensor shiftPressed
		controlled: Sensor controlKeyPressed
