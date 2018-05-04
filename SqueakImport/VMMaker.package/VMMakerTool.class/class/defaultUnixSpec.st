configurations
defaultUnixSpec
	"Typical VMMaker spec for a unix/linux target platform"

	"VMMakerTool defaultUnixSpec"

	^#(
		#(	"internal plugins"
			#ADPCMCodecPlugin
			#AsynchFilePlugin
			#BMPReadWriterPlugin
			#BalloonEnginePlugin
			#BitBltSimulation
			#CroquetPlugin
			#DESPlugin
			#DSAPlugin
			#DeflatePlugin
			#DropPlugin
			#FFTPlugin
			#FilePlugin
			#FloatArrayPlugin
			#FloatMathPlugin
			#GeniePlugin
			#JPEGReadWriter2Plugin
			#JPEGReaderPlugin
			#JoystickTabletPlugin
			#KlattSynthesizerPlugin
			#LargeIntegersPlugin
			#LocalePlugin
			#MD5Plugin
			#Matrix2x3Plugin
			#MiscPrimitivePlugin
			#RandPlugin
			#RePlugin
			#SHA256Plugin
			#SecurityPlugin
			#SerialPlugin
			#SlangTestPlugin
			#SlangTestSupportPlugin
			#SocketPlugin
			#SoundCodecPlugin
			#SoundGenerationPlugin
			#SoundPlugin
			#StarSqueakPlugin
			#SurfacePlugin
		)
		#(	"external plugins"
			#B3DAcceleratorPlugin
			#B3DEnginePlugin
			#ClipboardExtendedPlugin
			#DBusPlugin
			#FFIPlugin
			#FileCopyPlugin
			#FT2Plugin
			#GStreamerPlugin
			#HostWindowPlugin
			#ImmX11Plugin
			#KedamaPlugin2
			#MIDIPlugin
			#Mpeg3Plugin
			#RomePlugin
			#UUIDPlugin
			#UnixAioPlugin
			#UnixOSProcessPlugin
			#XDisplayControlPlugin
			#CameraPlugin
			#ScratchPlugin
			#UnicodePlugin
			#WeDoPlugin
			#SqueakSSLPlugin
		)
		true			"inline flag"
		false			"forBrowser flag"
		'unix'			"platform"
		'src'			"source directory for generated sources"
		'platforms'		"path to platform sources"
		4				"unused, was bytesPerWord which is now a compile time definition"
		true			"unused, was flag for source directtory pathname is relative"
		true			"unused, was flag for platforms directory path is relative"
		'ContextInterpreter'	"interpreter class name"
	)