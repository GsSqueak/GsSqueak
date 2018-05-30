private
releaseParagraphReally
	"Paragraph instantiation is lazy -- it will be created only when needed"

	editor ifNotNil: [
		self selectionChanged.
		self paragraph selectionStart: nil selectionStop: nil.
		editor := nil].
	paragraph ifNotNil: [paragraph := nil].
	container ifNotNil: [container releaseCachedState]