primitives
primitiveClipboardGet
	"Read the clipboard into the given UTF16 string.."

	| utf16Oop utf16 utf16Length count |
	<export: true>
	<var: 'utf16' declareC: 'unsigned short *utf16'>

	utf16Oop := interpreterProxy stackValue: 0.

	((interpreterProxy isIntegerObject: utf16Oop) or:
	 [(interpreterProxy isWords: utf16Oop) not]) ifTrue: [
		interpreterProxy success: false].

	interpreterProxy failed ifTrue: [^ 0].

	utf16 := self cCoerce: (interpreterProxy firstIndexableField: utf16Oop) to: 'unsigned short *'.
	utf16Length := 2 * (interpreterProxy stSizeOf: utf16Oop).

	count := self cCode: 'unicodeClipboardGet(utf16, utf16Length)'.

	interpreterProxy pop: 2
		thenPush: (interpreterProxy integerObjectOf: count).

	^ 0
