scrolling
offsetToShow: aRectangle 
	"Calculate the offset necessary to show the rectangle."
	| _gsSqueakTemp_offset _gsSqueakTemp_scrollRange _gsSqueakTemp_target |
	_gsSqueakTemp_offset := scroller offset.
	_gsSqueakTemp_scrollRange := self hTotalScrollRange @ self vTotalScrollRange.
	"Normalize the incoming rectangle."
	_gsSqueakTemp_target := (scroller width < aRectangle width
				ifTrue: [_gsSqueakTemp_offset x < aRectangle left
						ifTrue: ["Coming from left?"
							aRectangle right - scroller width]
						ifFalse: [aRectangle left]]
				ifFalse: [aRectangle left])
				@ (scroller height < aRectangle height
						ifTrue: [_gsSqueakTemp_offset y < aRectangle top
								ifTrue: ["Coming from top?"
									aRectangle bottom - scroller height]
								ifFalse: [aRectangle top]]
						ifFalse: [aRectangle top]) corner: (scroller width < aRectangle width
					ifTrue: [_gsSqueakTemp_offset x + scroller width > aRectangle right
							ifTrue: ["Coming from right?"
								aRectangle left + scroller width]
							ifFalse: [aRectangle right]]
					ifFalse: [aRectangle right])
					@ (scroller height < aRectangle height
							ifTrue: [_gsSqueakTemp_offset y + scroller height > aRectangle bottom
									ifTrue: ["Coming from bottom?"
										aRectangle top + scroller height]
									ifFalse: [aRectangle bottom]]
							ifFalse: [aRectangle bottom]).
	"Vertical Scrolling"
	_gsSqueakTemp_target top < _gsSqueakTemp_offset y
		ifTrue: [_gsSqueakTemp_offset := _gsSqueakTemp_offset x @ _gsSqueakTemp_target top].
	_gsSqueakTemp_target bottom > (_gsSqueakTemp_offset y + scroller height)
		ifTrue: [_gsSqueakTemp_offset := _gsSqueakTemp_offset x @ (_gsSqueakTemp_target bottom - scroller height)].
	"Horizontal Scrolling"
	_gsSqueakTemp_target left < _gsSqueakTemp_offset x
		ifTrue: [_gsSqueakTemp_offset := _gsSqueakTemp_target left @ _gsSqueakTemp_offset y].
	_gsSqueakTemp_target right > (_gsSqueakTemp_offset x + scroller width)
		ifTrue: [_gsSqueakTemp_offset := _gsSqueakTemp_target right - scroller width @ _gsSqueakTemp_offset y].
	^ (_gsSqueakTemp_offset min: _gsSqueakTemp_scrollRange - scroller extent)
		max: 0 @ 0