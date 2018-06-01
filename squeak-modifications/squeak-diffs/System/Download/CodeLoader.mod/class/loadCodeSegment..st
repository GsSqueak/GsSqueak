utilities
loadCodeSegment: segmentName
	| loader |
	loader := self new.
	loader loadSegments: (Array with: segmentName). 
	loader installSegments.