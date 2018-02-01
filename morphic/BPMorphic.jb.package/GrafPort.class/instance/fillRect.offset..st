drawing support
<<<<<<< HEAD
fillRect: rect offset: aPoint
  "The offset is really just for stupid InfiniteForms."

  | fc |
  fillPattern class == InfiniteForm
    ifTrue: [ 
      fc := halftoneForm.
      self fillColor: nil.
      fillPattern
        displayOnPort: ((self clippedBy: rect) colorMap: nil)
        at: aPoint.
      halftoneForm := fc.
      ^ self ].
  destX := rect left.
  destY := rect top.
  sourceX := 0.
  sourceY := 0.
  width := rect width.
  height := rect height.
  self copyBits
=======
fillRect: rect offset: aPoint 
	"The offset is really just for stupid InfiniteForms."
	| fc |
	fillPattern class == InfiniteForm
		ifTrue: [fc := halftoneForm.
			self fillColor: nil.
			fillPattern
				displayOnPort: ((self clippedBy: rect)
						colorMap: nil)
				at: aPoint.
			halftoneForm := fc.
			^ self].
	destX := rect left.
	destY := rect top.
	sourceX := 0.
	sourceY := 0.
	width := rect width.
	height := rect height.
	self copyBits
>>>>>>> 86cf22511f03aabffa314974130a17d983e10e09
