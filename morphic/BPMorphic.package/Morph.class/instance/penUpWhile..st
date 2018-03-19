-Etoys
penUpWhile: changeBlock 
	"Suppress any possible pen trail during the execution of changeBlock"
	self getPenDown
		ifTrue: ["If this is a costume for a player with its pen down, suppress
			any line."
			self liftPen.
			changeBlock value.
			self lowerPen]
		ifFalse: ["But usually, just do it."
			changeBlock value]