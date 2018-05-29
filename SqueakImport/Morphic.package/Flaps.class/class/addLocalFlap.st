new flap
addLocalFlap
	"Menu command -- let the user add a new project-local flap.  Once the new flap is born, the user can tell it to become a shared flap.  Obtain an initial name and edge for the flap, launch the flap, and also launch a menu governing the flap, so that the user can get started right away with customizing it."

	| aMenu reply aFlapTab aWorld edge |
	edge := self askForEdgeOfNewFlap.

	edge ifNotNil:
		[reply := UIManager default request: 'Wording for this flap: ' translated initialAnswer: 'Flap' translated.
		reply isEmptyOrNil ifFalse:
			[aFlapTab := self newFlapTitled: reply onEdge: edge.
			(aWorld := self currentWorld) addMorphFront: aFlapTab.
			aFlapTab adaptToWorld: aWorld.
			aMenu := aFlapTab buildHandleMenu: ActiveHand.
			aFlapTab addTitleForHaloMenu: aMenu.
			aFlapTab computeEdgeFraction.
			aMenu popUpEvent: ActiveEvent in: ActiveWorld]]
	
