initialization
addButtonRow
	| button button2 buttonRow button3 |
	buttonRow := RectangleMorph new borderWidth: 0; 
		color: Color transparent;
		layoutPolicy: TableLayout new;
		 hResizing: #spaceFil;
		 vResizing: #spaceFill;
		 cellPositioning: #center;
		 listCentering: #topLeft;
		 listDirection: #LeftToRight;
		 reverseTableCells: true;
		 cellInset: 4.

	button := PluggableButtonMorph on: self
				getState: nil
				action: #addHandle
				label: #addColorButtonLabel.
	button hResizing: #spaceFill;
			vResizing: #spaceFill.
	buttonRow  addMorph: button.

	button2 := PluggableButtonMorph on: self
				getState: nil
				action: #deleteHandle
				label: #removeColorButtonLabel.
	button2 hResizing: #spaceFill;
			vResizing: #spaceFill.
	buttonRow addMorph: button2.

	button3 := PluggableButtonMorph on: self
				getState: nil
				action: #delete
				label: #closeButtonLabel.
	button3 hResizing: #spaceFill;
			vResizing: #spaceFill.
	buttonRow addMorph: button3.
	
	self addMorph: buttonRow