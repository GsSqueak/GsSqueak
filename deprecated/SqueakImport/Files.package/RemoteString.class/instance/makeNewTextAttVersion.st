private
makeNewTextAttVersion
	"Create a new TextAttributes version because some inst var has changed.  If no change, don't make a new one."
	"Don't delete this method even though it has no callers!!!!!"

| obj struct tag |
"Note that TextFontReference and TextAnchor are forbidden."
obj := #(RunArray TextDoIt TextLink TextURL TextColor TextEmphasis TextFontChange TextKern TextLinkToImplementors 3 'a string') collect: [:each | | cls | 
		cls := Smalltalk at: each ifAbsent: [nil].
		cls ifNil: [each] ifNotNil: [cls new]].
struct := (SmartRefStream on: (RWBinaryOrTextStream on: String new)) instVarInfo: obj.
tag := self checkSum: struct printString.
TextAttributeStructureVersions ifNil: [TextAttributeStructureVersions := Dictionary new].
(struct = CurrentTextAttStructure) & (tag = CurrentTextAttVersion) 
	ifTrue: [^ false].
CurrentTextAttStructure := struct.
CurrentTextAttVersion := tag.
TextAttributeStructureVersions at: tag put: struct.
^ true