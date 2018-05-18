menus
collapse
	"Replace the receiver with a collapsed rendition of itself."

	|  w collapsedVersion a ht tab |

	(w := self world) ifNil: [^self].
	collapsedVersion := (self imageForm scaledToSize: 50@50) asMorph.
	collapsedVersion setProperty: #uncollapsedMorph toValue: self.
	collapsedVersion on: #mouseUp send: #uncollapseSketch to: collapsedVersion.
	
	collapsedVersion setBalloonText: ('A collapsed version of {1}.  Click to open it back up.' translated format: {self externalName}).

	self delete.
	w addMorphFront: (
		a := AlignmentMorph newRow
			hResizing: #shrinkWrap;
			vResizing: #shrinkWrap;
			borderWidth: 4;
			borderColor: Color white;
			addMorph: collapsedVersion;
			yourself).
	a setNameTo: self externalName.
	ht := (tab := Smalltalk at: #SugarNavTab ifPresent: [:c | ActiveWorld findA: c])
		ifNotNil:
			[tab height]
		ifNil:
			[80].
	a position: 0@ht.

	collapsedVersion setProperty: #collapsedMorphCarrier toValue: a.

	(self valueOfProperty: #collapsedPosition) ifNotNil:
		[:priorPosition |
			a position: priorPosition]