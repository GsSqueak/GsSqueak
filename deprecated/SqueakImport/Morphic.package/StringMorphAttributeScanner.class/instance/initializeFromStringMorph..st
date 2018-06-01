string morph
initializeFromStringMorph: aStringMorph

	actualFont := aStringMorph font ifNil: [ TextStyle defaultFont ].
	emphasis := actualFont emphasis.
	fontNumber := (actualFont textStyle ifNotNil: [:style | style fontIndexOf: actualFont]) ifNil: [ 1 ].
	textColor := aStringMorph color.
