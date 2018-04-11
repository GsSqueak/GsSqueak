-Etoys-support
copyCostumeStateFrom: aMorph 
	"Copy all state that should be persistant for costumes from aMorph"
	self rotationCenter: aMorph rotationCenter.
	self rotationStyle: aMorph rotationStyle.
	self referencePosition: aMorph referencePosition.
	self forwardDirection: aMorph forwardDirection