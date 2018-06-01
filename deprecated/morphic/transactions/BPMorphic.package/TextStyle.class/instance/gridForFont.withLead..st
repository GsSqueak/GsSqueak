private
gridForFont: fontIndex withLead: leadInteger 
	"Force whole style to suit one of its fonts. Assumes only one font
	referred to by runs."
	| _gsSqueakTemp_font |
	_gsSqueakTemp_font := self fontAt: fontIndex.
	self lineGrid: _gsSqueakTemp_font height + leadInteger.
	self baseline: _gsSqueakTemp_font ascent.
	self leading: leadInteger