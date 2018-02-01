color mapping
<<<<<<< HEAD
bitPatternFor: aColor
  "Return the pixel word for representing the given color on the receiver"

  aColor isColor
    ifFalse: [ ^ aColor bitPatternForDepth: self depth ].
  self hasNonStandardPalette
    ifTrue: [ ^ Bitmap with: (self pixelWordFor: aColor) ]
    ifFalse: [ ^ aColor bitPatternForDepth: self depth ]
=======
bitPatternFor: aColor 
	"Return the pixel word for representing the given color on the receiver"
	aColor isColor
		ifFalse: [^ aColor bitPatternForDepth: self depth].
	self hasNonStandardPalette
		ifTrue: [^ Bitmap
				with: (self pixelWordFor: aColor)]
		ifFalse: [^ aColor bitPatternForDepth: self depth]
>>>>>>> 86cf22511f03aabffa314974130a17d983e10e09
