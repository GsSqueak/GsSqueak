copying
updateReferencesUsing: aDictionary
	"Copy my recorder."

	super updateReferencesUsing: aDictionary.
	recorder := SoundRecorder new.
