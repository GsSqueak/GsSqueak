change reporting
userSelectedColor: aColor
  "The user, via the UI, chose aColor to be the color for the receiver; set
	it, and tell my owner in case he wishes to react"

  self color: aColor.
  self world ifNotNil: [ self owner colorChangedForSubmorph: self ]