-Etoys-support
asWearableCostume
	"Return a wearable costume for some player"
	^ (World drawingClass withForm: self imageForm)
		copyCostumeStateFrom: self