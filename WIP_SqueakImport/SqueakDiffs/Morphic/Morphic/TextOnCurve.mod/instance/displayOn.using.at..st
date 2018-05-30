display
displayOn: aCanvas using: displayScanner at: somePosition
	"Send all visible lines to the displayScanner for display"
	| warp lineRect lineCanvas backgroundColor lineForm leftInRun sourceQuad maxExtent |
	"most of these temps are initialized lazily and need to be at the method level - do not move into the block below!"
	warp := nil.
	self textSegmentsDo:
		[:line :destRect :segStart :segAngle |
		false ifTrue:
			["Show the dest rects for debugging..."
			aCanvas frameRectangle: destRect width: 1 color: Color black].
		(aCanvas isVisible: destRect) ifTrue:
			[warp ifNil:
				["Lazy initialization because may not have to display at all."
				maxExtent := lines inject: lines first rectangle extent 
					into: [:maxWid :lin | maxWid max: lin rectangle extent].
				lineForm := Form extent: maxExtent depth: aCanvas depth.
				displayScanner setDestForm: lineForm.
				lineRect := lineForm boundingBox.
				leftInRun := 0.
				backgroundColor := (curve borderWidth > 10
							ifTrue: [curve color]
							ifFalse: [curve owner isHandMorph
									ifTrue: [curve owner owner color]
									ifFalse: [curve owner color]]) dominantColor.
				warp := (aCanvas warpFrom: lineRect corners toRect: lineRect)
						cellSize: 2;  "installs a colormap if smoothing > 1"
						sourceForm: lineForm.
				warp colorMap: (self warpMapForDepth: aCanvas depth
									withTransparentFor: backgroundColor).
				lineCanvas := lineForm getCanvas].
			sourceQuad := destRect innerCorners collect:
				[:p | self pointInLine: line forDestPoint: p
						segStart: segStart segAngle: segAngle].
			lineForm fill: lineForm boundingBox fillColor: backgroundColor.
			self displaySelectionInLine: line on: lineCanvas.
			leftInRun := displayScanner displayLine: line offset: 0@0 leftInRun: leftInRun.
			warp sourceQuad: sourceQuad destRect: (destRect translateBy: aCanvas origin).
			warp warpBits]].
