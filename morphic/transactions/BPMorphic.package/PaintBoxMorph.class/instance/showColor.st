actions
showColor
	"Display the current color in all brushes, both on and off."
	| _gsSqueakTemp_offIndex _gsSqueakTemp_onIndex _gsSqueakTemp_center |
	currentColor
		ifNil: [^ self].
	"colorPatch color: currentColor.	May delete later"
	(brushes isNil
			or: [brushes first owner ~~ self])
		ifTrue: [brushes := OrderedCollection new.
			#(#brush1: #brush2: #brush3: #brush4: #brush5: #brush6: )
				do: [:sel | brushes
						addLast: (self submorphNamed: sel)]].
	brushes last offImage unhibernate.
	brushes last onImage unhibernate.
	brushes last pressedImage unhibernate.
	_gsSqueakTemp_center := brushes last offImage extent // 2.
	_gsSqueakTemp_offIndex := brushes last offImage pixelValueAt: _gsSqueakTemp_center.
	_gsSqueakTemp_onIndex := brushes last onImage pixelValueAt: _gsSqueakTemp_center.
	brushes
		do: [:bb | 
			bb offImage colors at: _gsSqueakTemp_offIndex + 1 put: currentColor.
			bb offImage clearColormapCache.
			bb onImage colors at: _gsSqueakTemp_onIndex + 1 put: currentColor.
			bb onImage clearColormapCache.
			bb invalidRect: bb bounds].
	self
		invalidRect: (brushes first topLeft rect: brushes last bottomRight)