initialize
withFileDo: aBlock 
	"Open the font file for the duration of aBlock"
	^ self class openFontFile: fileName do: aBlock