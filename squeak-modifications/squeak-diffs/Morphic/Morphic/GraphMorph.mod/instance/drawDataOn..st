private
drawDataOn: aCanvas

	| yScale baseLine x start end value left top bottom right |
	super drawOn: aCanvas.

	data isEmpty ifTrue: [^ self].
	maxVal = minVal ifTrue: [
		yScale := 1.
	] ifFalse: [
		yScale := (bounds height - (2 * borderWidth)) asFloat / (maxVal - minVal)].
	baseLine := bounds bottom - borderWidth + (minVal * yScale) truncated.
	left := top := 0. right := 10. bottom := 0.
	x := bounds left + borderWidth.
	start := (startIndex asInteger max: 1) min: data size.
	end := (start + bounds width) min: data size.
	start to: end do: [:i |
		left := x truncated. right := x + 1.
		right > (bounds right - borderWidth) ifTrue: [^ self].
		value := (data at: i) asFloat.
		value >= 0.0 ifTrue: [
			top := baseLine - (yScale * value) truncated.
			bottom := baseLine.
		] ifFalse: [
			top := baseLine.
			bottom := baseLine - (yScale * value) truncated].
		aCanvas fillRectangle: (left@top corner: right@bottom) color: dataColor.
		x := x + 1].
