recent colors
fixUpRecentColors
	| _gsSqueakTemp_inner _gsSqueakTemp_outer _gsSqueakTemp_border _gsSqueakTemp_box _gsSqueakTemp_form _gsSqueakTemp_newImage _gsSqueakTemp_canvas _gsSqueakTemp_morph |
	self fixUpColorPicker.
	recentColors := WriteStream on: Array new.
	_gsSqueakTemp_form := image.
	_gsSqueakTemp_newImage := Form extent: _gsSqueakTemp_form extent + (0 @ 41) depth: _gsSqueakTemp_form depth.
	_gsSqueakTemp_form displayOn: _gsSqueakTemp_newImage.
	_gsSqueakTemp_newImage
		copy: (0 @ (_gsSqueakTemp_form height - 10) extent: _gsSqueakTemp_form width @ (_gsSqueakTemp_newImage height - _gsSqueakTemp_form height + 10))
		from: 0 @ (_gsSqueakTemp_form height - (_gsSqueakTemp_newImage height - _gsSqueakTemp_form height + 10))
		in: _gsSqueakTemp_form
		rule: Form over.
	_gsSqueakTemp_canvas := _gsSqueakTemp_newImage getCanvas.
	_gsSqueakTemp_canvas
		line: 12 @ (_gsSqueakTemp_form height - 10)
		to: 92 @ (_gsSqueakTemp_form height - 10)
		width: 1
		color: Color black.
	_gsSqueakTemp_canvas := _gsSqueakTemp_canvas copyOffset: 12 @ (_gsSqueakTemp_form height - 9).
	_gsSqueakTemp_inner := Color
				r: 0.677
				g: 0.71
				b: 0.968.
	_gsSqueakTemp_outer := _gsSqueakTemp_inner darker darker.
	_gsSqueakTemp_border := Color
				r: 0.194
				g: 0.258
				b: 0.194.
	0
		to: 1
		do: [:y | 0
				to: 3
				do: [:x | 
					_gsSqueakTemp_box := x * 20 @ (y * 20) extent: 20 @ 20.
					_gsSqueakTemp_morph := BorderedMorph new
								bounds: ((_gsSqueakTemp_box insetBy: 1)
										translateBy: _gsSqueakTemp_canvas origin + bounds origin).
					_gsSqueakTemp_morph borderWidth: 1;
						 borderColor: _gsSqueakTemp_border.
					_gsSqueakTemp_morph color: Color white.
					_gsSqueakTemp_morph
						on: #mouseDown
						send: #mouseDownRecent:with:
						to: self.
					_gsSqueakTemp_morph
						on: #mouseMove
						send: #mouseStillDownRecent:with:
						to: self.
					_gsSqueakTemp_morph
						on: #mouseUp
						send: #mouseUpRecent:with:
						to: self.
					self addMorphFront: _gsSqueakTemp_morph.
					recentColors nextPut: _gsSqueakTemp_morph.
					_gsSqueakTemp_canvas fillRectangle: _gsSqueakTemp_box color: Color white.
					_gsSqueakTemp_canvas
						frameRectangle: (_gsSqueakTemp_box insetBy: 1)
						color: _gsSqueakTemp_border.
					_gsSqueakTemp_canvas frameRectangle: _gsSqueakTemp_box color: _gsSqueakTemp_inner.
					_gsSqueakTemp_box := _gsSqueakTemp_box insetBy: 1.
					_gsSqueakTemp_canvas
						line: _gsSqueakTemp_box topRight
						to: _gsSqueakTemp_box bottomRight
						width: 1
						color: _gsSqueakTemp_outer.
					_gsSqueakTemp_canvas
						line: _gsSqueakTemp_box bottomLeft
						to: _gsSqueakTemp_box bottomRight
						width: 1
						color: _gsSqueakTemp_outer]].
	recentColors := recentColors contents.
	(RecentColors isNil
			or: [RecentColors size ~= recentColors size])
		ifTrue: [RecentColors := recentColors
						collect: [:each | each color]]
		ifFalse: [RecentColors
				keysAndValuesDo: [:idx :aColor | (recentColors at: idx)
						color: aColor]].
	self image: _gsSqueakTemp_newImage.
	self toggleStamps.
	self toggleStamps