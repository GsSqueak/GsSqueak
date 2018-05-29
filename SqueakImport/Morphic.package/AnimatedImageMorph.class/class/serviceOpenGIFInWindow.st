fileIn/Out
serviceOpenGIFInWindow
	"Answer a service for opening a gif graphic in a window"
	^ (SimpleServiceEntry
		provider: self
		label: 'open the graphic as a morph'
		selector: #openGIFInWindow:
		description: 'open a GIF graphic file as a morph'
		buttonLabel: 'open')
		argumentGetter: [:fileList | fileList readOnlyStream]