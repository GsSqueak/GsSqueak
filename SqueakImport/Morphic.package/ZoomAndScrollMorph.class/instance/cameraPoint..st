scripting
cameraPoint: newPt

	| transform |

	transform := self myTransformMorph.
	self changeOffsetTo: newPt * transform scale - (transform innerBounds extent // 2) 

