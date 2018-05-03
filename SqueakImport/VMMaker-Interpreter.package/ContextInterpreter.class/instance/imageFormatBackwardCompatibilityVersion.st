image save/restore
imageFormatBackwardCompatibilityVersion
	"This VM is backwards-compatible with the immediately preceeding pre-closure version, and will allow loading images (or image segments) of that version."

	objectMemory bytesPerWord == 4
		ifTrue: [^6502]
		ifFalse: [^68000]