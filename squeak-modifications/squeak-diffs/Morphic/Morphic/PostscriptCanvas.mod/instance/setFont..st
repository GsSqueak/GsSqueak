private
setFont:aFont

	| fInfo |

	aFont = currentFont ifTrue: [^self].
	currentFont := aFont.
	self defineFont: aFont.
	fInfo := self class postscriptFontInfoForFont: aFont.

	target 
		selectflippedfont: fInfo first
		size: (aFont pixelSize * fInfo second)
		ascent: aFont ascent.
