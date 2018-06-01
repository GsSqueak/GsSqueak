page geometry
pageBBox
	| pageSize offset bbox trueExtent |
	trueExtent := savedMorphExtent * initialScale.
	"this one has been rotated"
	pageSize := self defaultPageSize.
	offset := pageSize extent - trueExtent / 2 max: 0 @ 0.
	bbox := offset extent: trueExtent.
	^ bbox