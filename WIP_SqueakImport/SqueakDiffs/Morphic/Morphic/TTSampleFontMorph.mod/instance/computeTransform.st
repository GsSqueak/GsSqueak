private
computeTransform
	| fullExtent scale |
	fullExtent := font bounds extent * 16.
	scale := self extent asFloatPoint / fullExtent asFloatPoint.
	transform := MatrixTransform2x3 withScale: scale.
	transform := transform composedWithGlobal: (MatrixTransform2x3 withOffset: self position).
	^transform