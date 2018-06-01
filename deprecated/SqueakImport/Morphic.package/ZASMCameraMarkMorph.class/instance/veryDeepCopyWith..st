copying
veryDeepCopyWith: deepCopier
	| camera page |
	"Keep the same camera???"
 
	(camera := self cameraController) ifNotNil: [
		(deepCopier references includesKey: camera) ifFalse: [
			"not recorded, outside our tree, use same camera"
			deepCopier references at: camera put: camera]].
	(page := self valueOfProperty: #bookPage) ifNotNil: [
		(deepCopier references includesKey: page) ifFalse: [
			deepCopier references at: page put: page]].

	^ super veryDeepCopyWith: deepCopier

