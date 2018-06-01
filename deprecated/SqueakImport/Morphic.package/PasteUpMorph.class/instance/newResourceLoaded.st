initialization
newResourceLoaded
	"Some resource has just been loaded. Notify all morphs in case somebody wants to update accordingly."
	self allMorphsDo:[:m| m resourceJustLoaded ].
	self fullRepaintNeeded.