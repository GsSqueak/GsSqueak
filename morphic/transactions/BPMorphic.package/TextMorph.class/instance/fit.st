private
fit
	"Adjust my bounds to fit the text. Should be a no-op if autoFit is not
	specified. Required after the text changes,
	or if wrapFlag is true and the user attempts to change the extent."
	| _gsSqueakTemp_newExtent _gsSqueakTemp_para _gsSqueakTemp_cBounds _gsSqueakTemp_lastOfLines _gsSqueakTemp_heightOfLast _gsSqueakTemp_wid |
	self isAutoFit
		ifTrue: [_gsSqueakTemp_wid := (text notNil
							and: [text size > 2])
						ifTrue: [5]
						ifFalse: [40].
			_gsSqueakTemp_newExtent := (self paragraph extent max: _gsSqueakTemp_wid @ self defaultLineHeight)
						+ (0 @ 2).
			_gsSqueakTemp_newExtent := _gsSqueakTemp_newExtent + (2 * borderWidth).
			margins
				ifNotNil: [_gsSqueakTemp_newExtent := ((0 @ 0 extent: _gsSqueakTemp_newExtent)
								expandBy: margins) extent].
			_gsSqueakTemp_newExtent ~= bounds extent
				ifTrue: [(container isNil
							and: [successor isNil])
						ifTrue: [_gsSqueakTemp_para := paragraph.
							"Save para (layoutChanged smashes it)"
							super extent: _gsSqueakTemp_newExtent.
							paragraph := _gsSqueakTemp_para]].
			container notNil & successor isNil
				ifTrue: [_gsSqueakTemp_cBounds := container bounds truncated.
					"23 sept 2000 - try to allow vertical growth"
					_gsSqueakTemp_lastOfLines := self paragraph lines last.
					_gsSqueakTemp_heightOfLast := _gsSqueakTemp_lastOfLines bottom - _gsSqueakTemp_lastOfLines top.
					(_gsSqueakTemp_lastOfLines last < text size
							and: [_gsSqueakTemp_lastOfLines bottom + _gsSqueakTemp_heightOfLast >= self bottom])
						ifTrue: [container releaseCachedState.
							_gsSqueakTemp_cBounds := _gsSqueakTemp_cBounds origin corner: _gsSqueakTemp_cBounds corner + (0 @ _gsSqueakTemp_heightOfLast)].
					self privateBounds: _gsSqueakTemp_cBounds]].
	"These statements should be pushed back into senders"
	self paragraph positionWhenComposed: self position.
	successor
		ifNotNil: [successor predecessorChanged].
	self changed
	"Too conservative: only paragraph composition
	should cause invalidation."