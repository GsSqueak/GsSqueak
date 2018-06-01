menu
recolorPixelsUsing: evt 
	"Let the user select a color to be remapped, and then a color to map that color to, then carry it out."
	| originalColor newColor |
	self inform: 'choose the color you want to replace' translated.
	self
		changeColorTarget: self
		selector: #rememberedColor:
		originalColor: nil
		hand: evt hand.
	"color to replace"
	originalColor := self rememberedColor ifNil: [ ^ self ].
	self inform: 'now choose the color you want to replace it with' translated.
	self
		changeColorTarget: self
		selector: #rememberedColor:
		originalColor: originalColor
		hand: evt hand.
	"new color"
	newColor := self rememberedColor ifNil: [ ^ self ].
	self
		recolorPixelsOfColor: originalColor
		with: newColor