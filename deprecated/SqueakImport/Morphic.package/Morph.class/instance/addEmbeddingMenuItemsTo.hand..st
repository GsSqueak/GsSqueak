meta-actions
addEmbeddingMenuItemsTo: aMenu hand: aHandMorph
	"Construct a menu offerring embed targets for the receiver.  If the incoming menu is is not degenerate, add the constructed menu as a submenu; in any case, answer the embed-target menu"

	| menu w |
	menu := MenuMorph new defaultTarget: self.
	w := self world.
	self potentialEmbeddingTargets reverseDo: [:m |
		menu add: (m == w ifTrue: ['desktop' translated] ifFalse: [m knownName ifNil:[m class name asString]]) target: m selector: #addMorphFrontFromWorldPosition: argumentList: {self topRendererOrSelf}.
		m == self topRendererOrSelf owner ifTrue:
			[menu lastItem color: Color red]].
	aMenu ifNotNil:
		[menu submorphCount > 0 
			ifTrue:[aMenu add:'embed into' translated subMenu: menu]].
	^ menu