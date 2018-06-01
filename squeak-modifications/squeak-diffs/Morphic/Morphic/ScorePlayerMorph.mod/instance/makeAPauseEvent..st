menu
makeAPauseEvent: evt

	| newWidget |

	newWidget := AlignmentMorph newRow.
	newWidget 
		color: Color orange; 
		borderWidth: 0; 
		layoutInset: 0;
		hResizing: #shrinkWrap; 
		vResizing: #shrinkWrap; 
		extent: 5@5;
		addMorph: (StringMorph contents: '[pause]' translated) lock;
		addMouseUpActionWith: (
			MessageSend receiver: self selector: #showResumeButtonInTheWorld
		).

	evt hand attachMorph: newWidget.