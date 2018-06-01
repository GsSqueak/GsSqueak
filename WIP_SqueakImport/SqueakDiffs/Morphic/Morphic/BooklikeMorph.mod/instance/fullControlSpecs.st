page controls
fullControlSpecs

	^ {
		#spacer.
		#variableSpacer.
		{'-'.		#deletePage.				'Delete this page' translated}.
		#spacer.
		{'«'.		#firstPage.				'First page' translated}.
		#spacer.
		{'<'. 		#previousPage.			'Previous page' translated}.
		#spacer.
		{'·'.		#invokeBookMenu. 		'Click here to get a menu of options for this book.' translated}.
		#spacer.
		{'>'.		#nextPage.				'Next page' translated}.
		#spacer.
		{ '»'.		#lastPage.				'Final page' translated}.
		#spacer.
		{'+'.		#insertPage.				'Add a new page after this one' translated}.
		#variableSpacer.
		{'³'.		#fewerPageControls.	'Fewer controls' translated}
}
