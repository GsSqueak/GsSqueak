accessing
balloonTextSelector
	"Answer balloon text selector item in the extension, nil if none"
	^ extension
		ifNotNil: [extension balloonTextSelector]