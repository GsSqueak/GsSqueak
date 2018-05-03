allocation
setGCBiasToGrowGCLimit: value
	"Primitive support. If the GC logic has  bias to grow, set growth limit"
	gcBiasToGrowGCLimit := value.
	gcBiasToGrowThreshold := youngStart - (self cCoerce: memory to: 'int').
