testing
okToClose
	"Answer if the unaccepted edit states are void.  If they are not then
	 offer to select a window with non-empty unaccepted edit state."

	modelStates withIndexDo:
		[:savedState :index|
		savedState ifNotNil:
			[(savedState last anySatisfy: [:editState| editState notNil]) ifTrue:
				[(PopUpMenu
					confirm: 'One or more windows have unsaved changes.'
					trueChoice: 'Close Anyway'
					falseChoice: 'Select Unsaved') ifTrue: [^true].
				 self selectWindowIndex: index.
				 ^false]]].
	^true