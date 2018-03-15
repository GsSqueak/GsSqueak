geometry
extent: aPoint 
	| _gsSqueakTemp_newExtent _gsSqueakTemp_priorEditor |
	bounds extent = aPoint
		ifTrue: [^ self].
	_gsSqueakTemp_priorEditor := editor.
	self isAutoFit
		ifTrue: [wrapFlag
				ifFalse: [^ self].
			"full autofit can't change"
			_gsSqueakTemp_newExtent := aPoint truncated max: self minimumExtent.
			_gsSqueakTemp_newExtent x = self extent x
				ifTrue: [^ self].
			"No change of wrap width"
			self releaseParagraphReally.
			"invalidate the paragraph cache"
			super extent: _gsSqueakTemp_newExtent.
			_gsSqueakTemp_priorEditor
				ifNil: [self fit
					"since the width has changed..."]
				ifNotNil: [self installEditorToReplace: _gsSqueakTemp_priorEditor]]
		ifFalse: [super
				extent: (aPoint truncated max: self minimumExtent).
			wrapFlag
				ifFalse: [^ self].
			"no effect on composition"
			self composeToBounds]