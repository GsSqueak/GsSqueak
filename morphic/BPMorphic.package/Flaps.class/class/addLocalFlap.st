new flap
addLocalFlap
	"Menu command -- let the user add a new project-local flap. Once the
	new flap is born, the user can tell it to become a shared flap. Obtain
	an initial name and edge for the flap, launch the flap, and also launch
	a menu governing the flap, so that the user can get started right
	away with customizing it."
	| _gsSqueakTemp_aMenu _gsSqueakTemp_reply _gsSqueakTemp_aFlapTab _gsSqueakTemp_aWorld _gsSqueakTemp_edge |
	_gsSqueakTemp_edge := self askForEdgeOfNewFlap.
	_gsSqueakTemp_edge
		ifNotNil: [_gsSqueakTemp_reply := UIManager default request: 'Wording for this flap: ' translated initialAnswer: 'Flap' translated.
			_gsSqueakTemp_reply isEmptyOrNil
				ifFalse: [_gsSqueakTemp_aFlapTab := self newFlapTitled: _gsSqueakTemp_reply onEdge: _gsSqueakTemp_edge.
					(_gsSqueakTemp_aWorld := self currentWorld) addMorphFront: _gsSqueakTemp_aFlapTab.
					_gsSqueakTemp_aFlapTab adaptToWorld: _gsSqueakTemp_aWorld.
					_gsSqueakTemp_aMenu := _gsSqueakTemp_aFlapTab buildHandleMenu: (Smalltalk at: #ActiveHand).
					_gsSqueakTemp_aFlapTab addTitleForHaloMenu: _gsSqueakTemp_aMenu.
					_gsSqueakTemp_aFlapTab computeEdgeFraction.
					_gsSqueakTemp_aMenu popUpEvent: (Smalltalk at: #ActiveEvent) in: (Smalltalk at: #ActiveWorld)]]