updating
updateSlider

	| imagesNeedUpdate |
	imagesNeedUpdate := upButton width ~= (self orientation == #horizontal ifTrue: [self height] ifFalse: [self width]).
	
	self menuButton
		visible: (self orientation == #horizontal or: [self class scrollBarsWithoutMenuButton]) not;
		bounds: self boundsForMenuButton.
	upButton
		visible: self class scrollBarsWithoutArrowButtons not;
		bounds: self boundsForUpButton.
	downButton
		visible: self class scrollBarsWithoutArrowButtons not;
		bounds: self boundsForDownButton.

	super updateSlider.

	pagingArea bounds: self totalSliderArea.
	self expandSlider.

	imagesNeedUpdate ifTrue: [
		self menuButton visible ifTrue: [self updateMenuButtonImage].
		upButton visible ifTrue: [self updateUpButtonImage].
		downButton visible ifTrue: [self updateDownButtonImage]].