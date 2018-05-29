class initialization
initialize
	"Class initialization"

	LastColorIndex := 0.
	Colors :=  {
		TranslucentColor r: 0.0 g: 0.0 b: 0.839 alpha: 0.267.
		TranslucentColor r: 0.484 g: 1.0 b: 0.452 alpha: 0.706.
		TranslucentColor r: 1.0 g: 0.355 b: 0.71 alpha: 0.569.
		TranslucentColor r: 1.0 g: 1.0 b: 0.03 alpha: 0.561.
		TranslucentColor r: 0.484 g: 0.161 b: 1.0 alpha: 0.529.
		TranslucentColor r: 0.097 g: 0.097 b: 0.097 alpha: 0.192.
	}.
	
	self registerInFlapsRegistry.	

"StickyPadMorph initialize"