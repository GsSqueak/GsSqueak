private
moveBy: delta
	positionWhenComposed := (positionWhenComposed ifNil: [ container origin ]) + delta.
	container := container translateBy: delta
