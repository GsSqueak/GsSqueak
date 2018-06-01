private
setLayout: layout in: widget
	"Arrange subview horizontally or vertically according to layout directive.
	If the subview dimensions were specified with layout frames rather than explicit
	rectangle sizes, then their window horizontal or vertical dimensions will be resized
	as needed to fit within the widget extent."

	self positionSubviewsWithin: widget.
	layout == #proportional ifTrue:[^self].
	layout == #horizontal ifTrue:[
		| prev subViewWidth widgetWidth xScale |
		subViewWidth := (widget subViews collect: [:e | e window extent x]) sum.
		widgetWidth := widget window extent x.
		xScale := widgetWidth / subViewWidth. "to adjust corner of prev prior to align:"
		prev := nil.
		widget subViews do:[:next| | newWindowWidth newCorner |
			prev ifNotNil:[ "resize prev window prior to aligning next"
				xScale < 1 ifTrue: [ "proportional placement spec requires resizing"
					newWindowWidth := (prev window extent x * xScale) truncated.
					newCorner := (prev window origin x + newWindowWidth)@(prev window corner y).
					prev setWindow: (prev window origin corner: newCorner)].
				next align: next viewport topLeft with: prev viewport topRight.
			].
			prev := next.
		].
		^self].
	layout == #vertical ifTrue:[
		| prev subViewHeight widgetHeight yScale |
		subViewHeight := (widget subViews collect: [:e | e window extent y]) sum.
		widgetHeight := widget window extent y.
		yScale := widgetHeight / subViewHeight. "to adjust corner of prev prior to align:"
		prev := nil.
		widget subViews do:[:next| | newWindowHeight newCorner |
			prev ifNotNil:[ "resize prev window prior to aligning next"
				yScale < 1 ifTrue: [ "proportional placement spec requires resizing"
					newWindowHeight := (prev window extent y * yScale) truncated.
					newCorner := (prev window corner x)@(prev window origin y + newWindowHeight).
					prev setWindow: (prev window origin corner: newCorner)].
				next align: next viewport topLeft with: prev viewport bottomLeft.
			].
			prev := next.
		].
		^self].
	^self error: 'Unknown layout: ', layout.