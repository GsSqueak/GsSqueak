actions
pickup: actionButton action: aSelector cursor: aCursor evt: evt 
	"Special version for pickup: and stamp:, because of these tests"
	| _gsSqueakTemp_ss _gsSqueakTemp_picker _gsSqueakTemp_old _gsSqueakTemp_map _gsSqueakTemp_stamper |
	self
		tool: actionButton
		action: aSelector
		cursor: aCursor
		evt: evt.
	aSelector == #stamp:
		ifTrue: [(stampHolder pickupButtons includes: actionButton)
				ifTrue: [_gsSqueakTemp_stamper := stampHolder otherButtonFor: actionButton.
					^ self
						pickup: _gsSqueakTemp_stamper
						action: #stamp:
						cursor: _gsSqueakTemp_stamper arguments third
						evt: evt].
			(stampHolder stampFormFor: actionButton)
				ifNil: ["If not stamp there, go to pickup mode"
					_gsSqueakTemp_picker := stampHolder otherButtonFor: actionButton.
					_gsSqueakTemp_picker state: #on.
					^ self
						pickup: _gsSqueakTemp_picker
						action: #pickup:
						cursor: _gsSqueakTemp_picker arguments third
						evt: evt]
				ifNotNil: [_gsSqueakTemp_old := stampHolder stampFormFor: actionButton.
					currentCursor := ColorForm extent: _gsSqueakTemp_old extent depth: 8.
					_gsSqueakTemp_old displayOn: currentCursor.
					_gsSqueakTemp_map := Color indexedColors copy.
					_gsSqueakTemp_map at: 1 put: Color transparent.
					currentCursor colors: _gsSqueakTemp_map.
					currentCursor offset: currentCursor extent // -2.
					"Emphisize the stamp button"
					actionButton owner
						borderColor: (Color
								r: 0.65
								g: 0.599
								b: 0.8)
					"layoutMorph"
					"color: (Color r: 1.0 g: 0.645 b: 0.419);"]].
	aSelector == #pickup:
		ifTrue: [_gsSqueakTemp_ss := self focusMorph.
			_gsSqueakTemp_ss
				ifNil: [self notCurrentlyPainting.
					self setAction: #paint: evt: evt]
				ifNotNil: [currentCursor := aCursor]]