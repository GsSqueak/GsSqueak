accessing
rememberedColor: aColor 	"Place aColor in a property so I can retrieve it later. A tortuous but	expedient flow of data"	^ self setProperty: #rememberedColor toValue: aColor