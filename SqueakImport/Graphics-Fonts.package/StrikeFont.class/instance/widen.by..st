character shapes
widen: char by: delta
	^ self alter: char formBlock:  "Make a new form, wider or narrower..."
		[:charForm |
		| newForm |
		newForm := Form extent: charForm extent + (delta@0).
		charForm displayOn: newForm.  "Copy this image into it"
		newForm]    "and substitute it in the font"