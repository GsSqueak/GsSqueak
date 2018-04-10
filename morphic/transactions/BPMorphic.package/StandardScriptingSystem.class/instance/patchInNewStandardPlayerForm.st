-Etoys-form dictionary
patchInNewStandardPlayerForm
	"Patch in a darker and larger representation of a Dot. No senders --
	called from the postscript of an update"
	"ScriptingSystem patchInNewStandardPlayerForm"
	FormDictionary
		at: #standardPlayer
		put: (Form
				extent: 13 @ 13
				depth: 16
				fromArray: #(0 0 0 65536 0 0 0 0 0 65537 65537 65536 0 0 0 65537 65537 65537 65537 65536 0 0 65537 65537 65537 65537 65536 0 1 65537 65537 65537 65537 65537 0 1 65537 65537 65537 65537 65537 0 65537 65537 65537 65537 65537 65537 65536 1 65537 65537 65537 65537 65537 0 1 65537 65537 65537 65537 65537 0 0 65537 65537 65537 65537 65536 0 0 65537 65537 65537 65537 65536 0 0 0 65537 65537 65536 0 0 0 0 0 65536 0 0 0 )
				offset: 0 @ 0)