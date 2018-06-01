initialization
initializeThePasteUp
"initialize the receiver's thePasteUp"
	thePasteUp := TextPlusPasteUpMorph new borderWidth: 0;
				 color: color.
	scroller addMorph: thePasteUp