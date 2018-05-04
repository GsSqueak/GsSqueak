class initialization
initializeInterpreterTypes
	"The list of supported interpreter types that will be presented as menu options.
	Context interpreter is the traditional Squeak interpreter VM. Stack interpreter is
	the newer stack interpreter that provides a basis for Cog and Spur developement.
	Other selections may be added to specify e.g. a Cog VM."

	InterpreterTypes := #( 'Context interpreter' 'Stack interpreter' )