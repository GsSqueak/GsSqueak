drawing
drawOn: aCanvas
	
	| tRect sRect columnScanner columnLeft |
	self backgroundColor ifNotNil: [:c |
		aCanvas fillRectangle: self innerBounds color: c].

	tRect := self toggleRectangle.	
	self drawToggleOn: aCanvas in: tRect.

	sRect := bounds withLeft: tRect right + self hMargin.
	sRect := sRect top: sRect top + sRect bottom - self fontToUse height // 2.	
	
	(container columns isNil or: [(contents asString indexOf: Character tab) = 0]) ifTrue: [
		icon ifNotNil: [
			aCanvas
				translucentImage: icon
				at: sRect left @ (self top + (self height - icon height // 2)).
			sRect := sRect left: sRect left + icon width + 2.
		].
		
		aCanvas drawString: contents asString in: sRect font: self fontToUse color: self colorToUse.
	
	] ifFalse: [
		columnLeft := sRect left.
		columnScanner := ReadStream on: contents asString.
		container columns withIndexDo: [ :widthSpec :column | | columnRect columnData columnWidth |
			"Draw icon."
			column = self class iconColumnIndex ifTrue: [
				icon ifNotNil: [
					aCanvas
						translucentImage: icon
						at: columnLeft @ (self top + (self height - icon height // 2)).
					columnLeft := columnLeft + icon width + 2]].

			columnWidth := self widthOfColumn: column.
			columnRect := columnLeft @ sRect top extent: columnWidth @ sRect height.
			columnData := columnScanner upTo: Character tab.
			
			"Draw string."
			columnData ifNotEmpty: [
				aCanvas drawString: columnData in: columnRect font: self fontToUse color: self colorToUse].

			"Compute next column offset."			
			columnLeft := columnRect right + 5.
			column = 1 ifTrue: [columnLeft := columnLeft - tRect right + self left].
			
		].
	]