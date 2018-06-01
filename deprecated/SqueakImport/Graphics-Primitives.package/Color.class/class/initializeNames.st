class initialization
initializeNames
	"Name some colors."
	"Color initializeNames"

	ColorNames := Set new.
	self named: #black put: (Color r: 0 g: 0 b: 0).
	self named: #veryVeryDarkGray put: (Color r: 0.125 g: 0.125 b: 0.125).
	self named: #veryDarkGray put: (Color r: 0.25 g: 0.25 b: 0.25).
	self named: #darkGray put: (Color r: 0.375 g: 0.375 b: 0.375).
	self named: #gray put: (Color r: 0.5 g: 0.5 b: 0.5).
	self named: #lightGray put: (Color r: 0.625 g: 0.625 b: 0.625).
	self named: #veryLightGray put: (Color r: 0.75 g: 0.75 b: 0.75).
	self named: #veryVeryLightGray put: (Color r: 0.875 g: 0.875 b: 0.875).
	self named: #white put: (Color r: 1.0 g: 1.0 b: 1.0).
	self named: #red put: (Color r: 1.0 g: 0 b: 0).
	self named: #yellow put: (Color r: 1.0 g: 1.0 b: 0).
	self named: #green put: (Color r: 0 g: 1.0 b: 0).
	self named: #cyan put: (Color r: 0 g: 1.0 b: 1.0).
	self named: #blue put: (Color r: 0 g: 0 b: 1.0).
	self named: #magenta put: (Color r: 1.0 g: 0 b: 1.0).
	self named: #brown put: (Color r: 0.6 g: 0.2 b: 0).
	self named: #orange put: (Color r: 1.0 g: 0.6 b: 0).
	self named: #lightRed put: (Color r: 1.0 g: 0.8 b: 0.8).
	self named: #lightYellow put: (Color r: 1.0 g: 1.0 b: 0.8).
	self named: #lightGreen put: (Color r: 0.8 g: 1.0 b: 0.6).
	self named: #lightCyan put: (Color r: 0.4 g: 1.0 b: 1.0).
	self named: #lightBlue put: (Color r: 0.8 g: 1.0 b: 1.0).
	self named: #lightMagenta put: (Color r: 1.0 g: 0.8 b: 1.0).
	self named: #lightBrown put: (Color r: 1.0 g: 0.6 b: 0.2).
	self named: #lightOrange put: (Color r: 1.0 g: 0.8 b: 0.4).
	self named: #transparent put: (TranslucentColor new alpha: 0.0).
	self named: #paleBuff put: (Color r: 254 g: 250 b: 235 range: 255).
	self named: #paleBlue put: (Color r: 222 g: 249 b: 254 range: 255).
	self named: #paleYellow put: (Color r: 255 g: 255 b: 217 range: 255).
	self named: #paleGreen put: (Color r: 223 g: 255 b: 213 range: 255).
	self named: #paleRed put: (Color r: 255 g: 230 b: 230 range: 255).
	self named: #veryPaleRed put: (Color r: 255 g: 242 b: 242 range: 255).
	self named: #paleTan put: (Color r: 235 g: 224 b: 199 range: 255).
	self named: #paleMagenta put: (Color r: 255 g: 230 b: 255 range: 255).
	self named: #paleOrange put: (Color r: 253 g: 237 b: 215 range: 255).
	self named: #palePeach put: (Color r: 255 g: 237 b: 213 range: 255).
	self named: #pantonePurpleU put: (Color r: 193 g: 81 b: 184 range: 255).

