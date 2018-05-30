as yet unclassified
rebuild

	self removeAllMorphs.
	self addARow: {
		(StringMorph contents: 'PostScript Printing Options') lock.
	}.
	self addARow: {
		self
			simpleToggleButtonFor: self
			attribute: #landscapeFlag
			help: 'Print in landscape mode'.
		(StringMorph contents: ' Landscape') lock.
	}.
	self addARow: {
		self
			simpleToggleButtonFor: self
			attribute: #drawAsBitmapFlag
			help: 'Print as a bitmap'.
		(StringMorph contents: ' Bitmap') lock.
	}.
	self addARow: {
		self
			simpleToggleButtonFor: self
			attribute: #scaleToFitPage
			help: 'Scale printing to fill page'.
		(StringMorph contents: ' Scale to fit') lock.
	}.


	self addARow: {
		self printButton.
		self previewButton.
		self cancelButton.
	}.