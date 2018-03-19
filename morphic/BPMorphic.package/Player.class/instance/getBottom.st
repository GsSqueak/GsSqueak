slot getters/setters
getBottom
	"Answer the bottom coordinate, in the cartesian sense (decreases
	towards bottom of screen)"
	^ self costume cartesianBoundsTopLeft y - self costume height