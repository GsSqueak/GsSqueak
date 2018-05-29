composition
composeLinesFrom: startingIndex withLines: startingLines atY: startingY 
	"Here we determine the 'lines' of text that will fit along each segment of the curve. For each line, we determine its rectangle, then the dest wuadrilateral that it willbe rotated to.  Then, we take the outer hull to determine a dest rectangle for WarpBlt.  In addition we need the segment pivot point and angle, from which the source quadrilateral may be computed."

	| charIndex scanner line firstLine curveSegments segIndex pa pb segLen lineRect textSegments segDelta segAngle destRect destQuad i oldBounds |
	(oldBounds := container bounds) ifNotNil: [curve invalidRect: oldBounds].
	charIndex := startingIndex.
	lines := startingLines.
	curveSegments := curve lineSegments.
	container textDirection < 0 
		ifTrue: 
			[curveSegments := curveSegments reversed 
						collect: [:seg | Array with: (seg second) with: seg first]].
	textSegments := OrderedCollection new.
	scanner := SegmentScanner new text: text textStyle: textStyle.
	segIndex := 1.	"For curves, segIndex is just an index."
	firstLine := true.
	pa := curveSegments first first.
	[charIndex <= text size and: [segIndex <= curveSegments size]] whileTrue: 
			[curve isCurve ifFalse: [pa := (curveSegments at: segIndex) first].
			pb := (curveSegments at: segIndex) last.
			segDelta := pb - pa.	"Direction of this segment"
			segLen := segDelta r.
			lineRect := 0 @ 0 extent: segLen asInteger @ textStyle lineGrid.
			line := scanner 
						composeFrom: charIndex
						inRectangle: lineRect
						firstLine: firstLine
						leftSide: true
						rightSide: true.
			line setRight: scanner rightX.
			line width > 0 
				ifTrue: 
					[lines addLast: line.
					segAngle := segDelta theta.
					destQuad := line rectangle corners collect: 
									[:p | 
									(p translateBy: pa - (0 @ (line baseline + container baseline))) 
										rotateBy: segAngle negated
										about: pa].
					destRect := Rectangle encompassing: destQuad.
					textSegments addLast: (Array 
								with: destRect truncated
								with: pa
								with: segAngle).
					pa := pa + ((pb - pa) * line width / segLen).
					charIndex := line last + 1].
			segIndex := segIndex + 1.
			firstLine := false].
	lines isEmpty 
		ifTrue: 
			["No space in container or empty text"

			line := (TextLine 
						start: startingIndex
						stop: startingIndex - 1
						internalSpaces: 0
						paddingWidth: 0)
						rectangle: (0 @ 0 extent: 10 @ textStyle lineGrid);
						lineHeight: textStyle lineGrid baseline: textStyle baseline.
			lines := Array with: line.
			textSegments addLast: (Array 
						with: (curve vertices first extent: line rectangle extent)
						with: curve vertices first
						with: 0.0)].
	"end of segments, now attempt word break."
	lines last last < text size 
		ifTrue: 
			[
			[lines size > 1 
				and: [(text at: (i := lines last last) + 1) ~= Character space]] 
					whileTrue: 
						[i = lines last first 
							ifTrue: 
								[lines removeLast.
								textSegments removeLast]
							ifFalse: [lines last stop: i - 1]]].
	lines := lines asArray.
	container textSegments: textSegments asArray.
	curve invalidRect: container bounds.
	^maxRightX