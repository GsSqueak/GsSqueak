layout
updateMinimumExtent

	| hMin vMin |
	self label isMorph
		ifTrue: [^ self minimumExtent: self label minExtent].

	hMin := vMin := 0.
	self hResizing ~~ #spaceFill
		ifTrue: [hMin := (self font widthOfString: self label)].
	self vResizing ~~ #spaceFill
		ifTrue: [vMin := self font height].

	hMin := hMin + (2* self borderStyle width).
	vMin := vMin + (2* self borderStyle width).
			
	self layoutInset isRectangle
		ifTrue: [
			hMin := hMin + self layoutInset left + self layoutInset right.
			vMin := vMin + self layoutInset top + self layoutInset bottom]
		ifFalse: [self layoutInset isPoint
			ifTrue: [
				hMin := hMin + (2* self layoutInset x).
				vMin := vMin + (2* self layoutInset y)]
			ifFalse: [
				hMin := hMin + (2* self layoutInset).
				vMin := vMin + (2* self layoutInset)]].
	
	self minimumExtent: hMin @ vMin.

	"Since we have no submorphs, we have to resize here if we want to shrink wrap."
	self hResizing == #shrinkWrap ifTrue: [self width: hMin].
	self vResizing == #shrinkWrap ifTrue: [self height: vMin].