instance creation
newOnForm: aForm
	| pen |
	pen := super new.
	pen setDestForm: aForm.
	pen sourceOrigin: 0@0.
	pen home.
	pen defaultNib: 1.
	pen north.
	pen down.
	^ pen