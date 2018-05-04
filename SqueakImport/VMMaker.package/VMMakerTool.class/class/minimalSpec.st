configurations
minimalSpec
	"VMMaker spec for a minimal VM"

	"VMMakerTool minimalSpec"

	^#(
		#(	"internal plugins required for a minimum usable VM"
			#BitBltSimulation
			#BalloonEnginePlugin
			#FilePlugin
		)
		#(	"external plugins not strictly required"
			#SocketPlugin
		)
		true			"inline flag"
		false			"forBrowser flag"
		nil				"platform (unspecified)"
		'src'			"source directory for generated sources"
		'platforms'		"path to platform sources"
		4				"unused, was bytesPerWord which is now a compile time definition"
		true			"unused, was flag for source directtory pathname is relative"
		true			"unused, was flag for platforms directory path is relative"
		'ContextInterpreter'	"interpreter class name"
	)