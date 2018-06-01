scrolling
offsetToShow: aRectangle
	"Calculate the offset necessary to show the rectangle."
	
	| offset scrollRange target |
	offset := scroller offset.
	scrollRange := self hTotalScrollRange @ self vTotalScrollRange.
	
	"Normalize the incoming rectangle."
	target := 
			(scroller width < aRectangle width
				ifTrue: [offset x < aRectangle left "Coming from left?"
					ifTrue: [aRectangle right - scroller width]
					ifFalse: [aRectangle left]]
				ifFalse: [aRectangle left])
		@
			(scroller height < aRectangle height
				ifTrue: [offset y < aRectangle top "Coming from top?"
					ifTrue: [aRectangle bottom - scroller height]
					ifFalse: [aRectangle top]]
				ifFalse: [aRectangle top])
		corner: 
			(scroller width < aRectangle width
				ifTrue: [offset x + scroller width > aRectangle right "Coming from right?"
					ifTrue: [aRectangle left + scroller width]
					ifFalse: [aRectangle right]]
				ifFalse: [aRectangle right])
		@
			(scroller height < aRectangle height
				ifTrue: [offset y + scroller height > aRectangle bottom "Coming from bottom?"
					ifTrue: [aRectangle top + scroller height]
					ifFalse: [aRectangle bottom]]
				ifFalse: [aRectangle bottom]).

	"Vertical Scrolling"
	target top < offset y
		ifTrue: [offset := offset x @ target top].	
	target bottom > (offset y + scroller height)
		ifTrue: [offset := offset x @ (target bottom - scroller height)].
	
	"Horizontal Scrolling"
	target left < offset x
		ifTrue: [offset := target left @ offset y].
	target right > (offset x + scroller width)
		ifTrue: [offset := (target right - scroller width) @ offset y].

	^ (offset min: scrollRange - scroller extent) max: 0@0