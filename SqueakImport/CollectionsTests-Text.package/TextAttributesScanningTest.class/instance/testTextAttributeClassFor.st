testing
testTextAttributeClassFor
	"Verify class identifiers as used in RunArray class>>scanFrom:"

	self assert: TextAlignment equals: (TextAttribute classFor: $a).
	self assert: TextFontChange equals: (TextAttribute classFor: $f).
	self assert: TextFontReference equals: (TextAttribute classFor: $F).
	self assert: TextEmphasis equals: (TextAttribute classFor: $b).
	self assert: TextEmphasis equals: (TextAttribute classFor: $i).
	self assert: TextEmphasis equals: (TextAttribute classFor: $u).
	self assert: TextEmphasis equals: (TextAttribute classFor: $=).
	self assert: TextEmphasis equals: (TextAttribute classFor: $n).
	self assert: TextKern equals: (TextAttribute classFor: $-).
	self assert: TextKern equals: (TextAttribute classFor: $+).
	self assert: TextColor equals: (TextAttribute classFor: $c).
	self assert: TextLink equals: (TextAttribute classFor: $L).
	self assert: TextURL equals: (TextAttribute classFor: $R).
	self assert: TextSqkPageLink equals: (TextAttribute classFor: $q).
	self assert: TextSqkProjectLink equals: (TextAttribute classFor: $p).
	self assert: TextPrintIt equals: (TextAttribute classFor: $P).
	self assert: TextDoIt equals: (TextAttribute classFor: $d).
