private
from: textOrStream class: aClass notifying: req
	self setCue:
		(CompilationCue
			source: textOrStream
			class: aClass
			requestor: req)
