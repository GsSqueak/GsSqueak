navigation
deleteCurrentPage

	| outerWrapper |

	loadedProject ifNil: [^self].
	outerWrapper := loadedProject world ownerThatIsA: EmbeddedWorldBorderMorph.
	outerWrapper ifNil: [^self].
	outerWrapper delete.
	loadedProject := nil.

