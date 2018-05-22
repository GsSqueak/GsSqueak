accessing
fallbackFont
	"Answers the fallbackFont for the receiver. The fallback font must be some derivative of the receiver since it will not be asked to install itself properly on the target BitBlt so rendering a completely different font here is simply not possible. The default implementation uses a synthetic font that maps all characters to question marks."
	^ fallbackFont
		ifNil: [fallbackFont := FixedFaceFont new errorFont baseFont: self]