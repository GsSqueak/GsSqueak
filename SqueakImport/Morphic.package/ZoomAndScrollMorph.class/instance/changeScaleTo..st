as yet unclassified
changeScaleTo: aNumber

	| transform innerPasteup min1 min2 newScale oldPoint |

	transform := self myTransformMorph.
	"oldScale := transform scale."
	innerPasteup := transform firstSubmorph.

	min1 := transform width / innerPasteup width asFloat.
	min2 := transform height / innerPasteup height asFloat.
	newScale := (aNumber max: min1) max: min2.

	oldPoint := self cameraPoint.
	transform scale: newScale.
	self cameraPoint: oldPoint.

	"scaleR := newScale / oldScale.
	half := transform extent // 2.
	half := 0@0.
	self changeOffsetBy: scaleR * (transform offset + half) - half - transform offset."

"==Alan's preferred factors
pan = 0.0425531914893617
zoom = 0.099290780141844
==="
