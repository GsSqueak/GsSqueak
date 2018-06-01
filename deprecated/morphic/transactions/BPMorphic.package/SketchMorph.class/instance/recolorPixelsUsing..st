menu
recolorPixelsUsing: evt 
	"Let the user select a color to be remapped, and then a color to map
	that color to, then carry it out."
	| _gsSqueakTemp_originalColor _gsSqueakTemp_newColor |
	self inform: 'choose the color you want to replace' translated.
	self
		changeColorTarget: self
		selector: #rememberedColor:
		originalColor: nil
		hand: evt hand.
	"color to replace"
	_gsSqueakTemp_originalColor := self rememberedColor
				ifNil: [^ self].
	self inform: 'now choose the color you want to replace it with' translated.
	self
		changeColorTarget: self
		selector: #rememberedColor:
		originalColor: _gsSqueakTemp_originalColor
		hand: evt hand.
	"new color"
	_gsSqueakTemp_newColor := self rememberedColor
				ifNil: [^ self].
	self recolorPixelsOfColor: _gsSqueakTemp_originalColor with: _gsSqueakTemp_newColor