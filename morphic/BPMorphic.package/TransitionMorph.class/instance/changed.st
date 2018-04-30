updating
changed
	"The default (super) method is, generally much slower than need be,
	since many transitions only change part of the screen on any given
	step of the animation. The purpose of this method is to effect some of
	those savings."
	| _gsSqueakTemp_loc _gsSqueakTemp_box _gsSqueakTemp_boxPrev _gsSqueakTemp_h _gsSqueakTemp_w |
	(stepNumber between: 1 and: nSteps)
		ifFalse: [^ super changed].
	effect = #slideBoth
		ifTrue: [^ super changed].
	effect = #slideOver
		ifTrue: [_gsSqueakTemp_loc := self stepFrom: self position - (self extent * direction) to: self position.
			^ self
				invalidRect: (((_gsSqueakTemp_loc extent: self extent)
						expandBy: 1)
						intersect: bounds)].
	effect = #slideAway
		ifTrue: [_gsSqueakTemp_loc := self prevStepFrom: self position to: self position + (self extent * direction).
			^ self
				invalidRect: (((_gsSqueakTemp_loc extent: self extent)
						expandBy: 1)
						intersect: bounds)].
	effect = #slideBorder
		ifTrue: [_gsSqueakTemp_box := endForm boundingBox
						translateBy: (self stepFrom: self topLeft - (self extent * direction) to: self topLeft).
			_gsSqueakTemp_boxPrev := endForm boundingBox
						translateBy: (self prevStepFrom: self topLeft - (self extent * direction) to: self topLeft).
			^ self
				invalidate: (_gsSqueakTemp_box expandBy: 1)
				areasOutside: _gsSqueakTemp_boxPrev].
	effect = #pageForward
		ifTrue: [_gsSqueakTemp_loc := self prevStepFrom: 0 @ 0 to: self extent * direction.
			^ self
				invalidRect: (((bounds translateBy: _gsSqueakTemp_loc)
						expandBy: 1)
						intersect: bounds)].
	effect = #pageBack
		ifTrue: [_gsSqueakTemp_loc := self stepFrom: self extent * direction negated to: 0 @ 0.
			^ self
				invalidRect: (((bounds translateBy: _gsSqueakTemp_loc)
						expandBy: 1)
						intersect: bounds)].
	effect = #frenchDoor
		ifTrue: [_gsSqueakTemp_h := self height.
			_gsSqueakTemp_w := self width.
			direction = #in
				ifTrue: [_gsSqueakTemp_box := Rectangle
								center: self center
								extent: (self stepFrom: 0 @ _gsSqueakTemp_h to: self extent).
					_gsSqueakTemp_boxPrev := Rectangle
								center: self center
								extent: (self prevStepFrom: 0 @ _gsSqueakTemp_h to: self extent).
					^ self
						invalidate: (_gsSqueakTemp_box expandBy: 1)
						areasOutside: _gsSqueakTemp_boxPrev].
			direction = #out
				ifTrue: [_gsSqueakTemp_box := Rectangle
								center: self center
								extent: (self stepFrom: self extent to: 0 @ _gsSqueakTemp_h).
					_gsSqueakTemp_boxPrev := Rectangle
								center: self center
								extent: (self prevStepFrom: self extent to: 0 @ _gsSqueakTemp_h).
					^ self
						invalidate: (_gsSqueakTemp_boxPrev expandBy: 1)
						areasOutside: _gsSqueakTemp_box].
			direction = #inH
				ifTrue: [_gsSqueakTemp_box := Rectangle
								center: self center
								extent: (self stepFrom: _gsSqueakTemp_w @ 0 to: self extent).
					_gsSqueakTemp_boxPrev := Rectangle
								center: self center
								extent: (self prevStepFrom: _gsSqueakTemp_w @ 0 to: self extent).
					^ self
						invalidate: (_gsSqueakTemp_box expandBy: 1)
						areasOutside: _gsSqueakTemp_boxPrev].
			direction = #outH
				ifTrue: [_gsSqueakTemp_box := Rectangle
								center: self center
								extent: (self stepFrom: self extent to: _gsSqueakTemp_w @ 0).
					_gsSqueakTemp_boxPrev := Rectangle
								center: self center
								extent: (self prevStepFrom: self extent to: _gsSqueakTemp_w @ 0).
					^ self
						invalidate: (_gsSqueakTemp_boxPrev expandBy: 1)
						areasOutside: _gsSqueakTemp_box]].
	effect = #zoomFrame
		ifTrue: [direction = #in
				ifTrue: [_gsSqueakTemp_box := Rectangle
								center: self center
								extent: (self stepFrom: 0 @ 0 to: self extent).
					_gsSqueakTemp_boxPrev := Rectangle
								center: self center
								extent: (self prevStepFrom: 0 @ 0 to: self extent).
					^ self
						invalidate: (_gsSqueakTemp_box expandBy: 1)
						areasOutside: _gsSqueakTemp_boxPrev].
			direction = #out
				ifTrue: [_gsSqueakTemp_box := Rectangle
								center: self center
								extent: (self stepFrom: self extent to: 0 @ 0).
					_gsSqueakTemp_boxPrev := Rectangle
								center: self center
								extent: (self prevStepFrom: self extent to: 0 @ 0).
					^ self
						invalidate: (_gsSqueakTemp_boxPrev expandBy: 1)
						areasOutside: _gsSqueakTemp_box]].
	effect = #zoom
		ifTrue: [_gsSqueakTemp_box := Rectangle
						center: self center
						extent: (direction = #in
								ifTrue: [self stepFrom: 0 @ 0 to: self extent]
								ifFalse: [self prevStepFrom: self extent to: 0 @ 0]).
			^ self
				invalidRect: ((_gsSqueakTemp_box expandBy: 1)
						intersect: bounds)].
	^ super changed