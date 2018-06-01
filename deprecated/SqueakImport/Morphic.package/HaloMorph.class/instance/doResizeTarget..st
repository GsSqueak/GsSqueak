dragging or resizing
doResizeTarget: evt 
	| newExtent |
	newExtent := originalExtent + (evt position - positionOffset * 2).
	(newExtent x > 1 and: [ newExtent y > 1 ]) ifTrue:
		[ | oldExtent dockingBarBottom newPosition |
		oldExtent := target extent.
		dockingBarBottom := owner mainDockingBars
			inject: 0
			into: [ : bottomMostBottom : each | bottomMostBottom max: each bottom ].
		target setExtentFromHalo: (newExtent min: owner extent x @ (owner extent y - dockingBarBottom)).
		newPosition := target position - (target extent - oldExtent // 2).
		newPosition := (newPosition x
			min: owner extent x - newExtent x
			max: 0) @
			(newPosition y
				min: owner extent y - newExtent y
				max: dockingBarBottom).
		target
			setConstrainedPosition: newPosition
			hangOut: true ].
	self bounds: self target worldBoundsForHalo