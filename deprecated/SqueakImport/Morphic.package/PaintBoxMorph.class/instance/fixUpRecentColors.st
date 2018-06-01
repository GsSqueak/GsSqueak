recent colors
fixUpRecentColors
	| inner outer border box form newImage canvas morph |
	self fixUpColorPicker.
	recentColors := WriteStream on: Array new.
	form := image.
	newImage := Form extent: form extent + (0 @ 41) depth: form depth.
	form displayOn: newImage.
	newImage 
		copy: (0 @ (form height - 10) 
				extent: form width @ (newImage height - form height + 10))
		from: 0 @ (form height - (newImage height - form height + 10))
		in: form
		rule: Form over.
	canvas := newImage getCanvas.
	canvas 
		line: 12 @ (form height - 10)
		to: 92 @ (form height - 10)
		width: 1
		color: Color black.
	canvas := canvas copyOffset: 12 @ (form height - 9).
	inner := Color 
				r: 0.677
				g: 0.71
				b: 0.968.
	outer := inner darker darker.
	border := Color 
				r: 0.194
				g: 0.258
				b: 0.194.
	0 to: 1
		do: 
			[:y | 
			0 to: 3
				do: 
					[:x | 
					box := (x * 20) @ (y * 20) extent: 20 @ 20.
					morph := BorderedMorph new 
								bounds: ((box insetBy: 1) translateBy: canvas origin + bounds origin).
					morph
						borderWidth: 1;
						borderColor: border.
					morph color: Color white.
					morph 
						on: #mouseDown
						send: #mouseDownRecent:with:
						to: self.
					morph 
						on: #mouseMove
						send: #mouseStillDownRecent:with:
						to: self.
					morph 
						on: #mouseUp
						send: #mouseUpRecent:with:
						to: self.
					self addMorphFront: morph.
					recentColors nextPut: morph.
					canvas fillRectangle: box color: Color white.
					canvas frameRectangle: (box insetBy: 1) color: border.
					canvas frameRectangle: box color: inner.
					box := box insetBy: 1.
					canvas 
						line: box topRight
						to: box bottomRight
						width: 1
						color: outer.
					canvas 
						line: box bottomLeft
						to: box bottomRight
						width: 1
						color: outer]].
	recentColors := recentColors contents.
	(RecentColors isNil or: [RecentColors size ~= recentColors size]) 
		ifTrue: [RecentColors := recentColors collect: [:each | each color]]
		ifFalse: 
			[RecentColors 
				keysAndValuesDo: [:idx :aColor | (recentColors at: idx) color: aColor]].
	self image: newImage.
	self toggleStamps.
	self toggleStamps