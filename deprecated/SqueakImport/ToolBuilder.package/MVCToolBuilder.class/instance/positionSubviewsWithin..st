private
positionSubviewsWithin: widget
	"Translate subviews to position the viewport of each subView relative to
	the widget window origin. If subviews are repositioned, as in a row of button
	views arranged within a view, then the transformations will later be rescaled
	to fit the subviews within the widget window."

	widget subViews ifNotNil: [:subViews |
		subViews isEmpty ifFalse: [ | translation |
			translation := widget window origin - subViews first window origin.
			subViews do: [:v | 
				v setTransformation: (v transformation translateBy: translation)]]].
