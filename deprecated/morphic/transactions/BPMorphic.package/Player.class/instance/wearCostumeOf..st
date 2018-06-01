costume
wearCostumeOf: anotherPlayer 
	"Put on a costume similar to the one currently worn by anotherPlayer"
	self
		renderedCostume: (anotherPlayer costume renderedMorph asWearableCostumeOfExtent: self costume extent)
		remember: anotherPlayer costume shouldRememberCostumes