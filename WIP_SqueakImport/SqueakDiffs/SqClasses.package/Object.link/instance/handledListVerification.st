updating
handledListVerification
	"When a self-updating PluggableListMorph lazily checks to see the state of affairs, it first gives its model an opportunity to handle the list verification itself (this is appropriate for some models, such as VersionsBrowser); if a list's model has indeed handled things itself, it returns true here"

	^ false
