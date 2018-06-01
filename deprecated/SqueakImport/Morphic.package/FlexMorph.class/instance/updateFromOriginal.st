private
updateFromOriginal

	| intermediateForm |
	intermediateForm := originalMorph imageForm offset: 0@0.
	intermediateForm border: intermediateForm boundingBox
		widthRectangle: (borderWidth corner: borderWidth+1)
		rule: Form over fillColor: borderColor.
	self form: intermediateForm.
	originalMorph fullReleaseCachedState