class initialization
initialize  "PopUpMenu initialize"
	(MenuStyle := TextStyle default copy)
		gridForFont: TextStyle default defaultFontIndex withLead: 0;
		centered.
	"squeak would call rescan on all instances here.
	on GsSqueak bootstrap there are no instances at this point.
	this call was removed to not require a commit here."
