initialisation
default
	"return a VMMaker initialised to build a default no-internal-plugins, no-external-plugins vm codebase"
	^self forPlatform: SmalltalkImage current platformName