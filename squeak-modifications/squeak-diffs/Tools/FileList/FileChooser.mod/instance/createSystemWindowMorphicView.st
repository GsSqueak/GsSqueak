ui creation
createSystemWindowMorphicView
	| m |
	m := SystemWindow labelled: 'Please select a file' translated. "self directory pathName."
	"m deleteCloseBox."
	self setMorphicView: m.