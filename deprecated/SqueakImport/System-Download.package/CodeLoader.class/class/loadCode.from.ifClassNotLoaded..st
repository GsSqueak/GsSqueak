utilities
loadCode: codeSegmentName from: baseURL ifClassNotLoaded: testClass

	CodeLoader defaultBaseURL: baseURL.
	(Smalltalk includesKey: testClass)
		ifFalse: [CodeLoader loadCodeSegment: codeSegmentName].
