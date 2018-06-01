menu
addCustomMenuItems: aCustomMenu hand: aHandMorph

	| movies subMenu |
	super addCustomMenuItems: aCustomMenu hand: aHandMorph.
	aCustomMenu addLine.
	subMenu := MenuMorph new defaultTarget: self.
	frameList size > 1 ifTrue: [
		subMenu add: 'repaint' translated action: #editDrawing.
		subMenu add: 'set rotation center' translated action: #setRotationCenter.
		subMenu add: 'play once' translated action: #playOnce.
		subMenu add: 'play loop' translated action: #playLoop.
		subMenu add: 'stop playing' translated action: #stopPlaying.
		currentFrameIndex > 1 ifTrue: [
			subMenu add: 'previous frame' translated action: #previousFrame].
		currentFrameIndex < frameList size ifTrue: [
			subMenu add: 'next frame' translated action: #nextFrame]].
	subMenu add: 'extract this frame' translated action: #extractFrame:.
	movies :=
		(self world rootMorphsAt: aHandMorph targetPoint)
			select: [:m | (m isKindOf: MovieMorph) or:
						[m isSketchMorph]].
	(movies size > 1) ifTrue:
		[subMenu add: 'insert into movie' translated action: #insertIntoMovie:].
	aCustomMenu add: 'movie...' translated subMenu: subMenu
