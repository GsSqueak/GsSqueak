private
wideCharacterMap
	"used for comparing with WideByteCharacterSet"
	
	| wide |
	wide := WideCharacterSet new.
	wide addAll: self.
	^wide wideCharacterMap