colormaps
cachedColormapFrom: sourceDepth to: destDepth 
	"Return a cached colormap for mapping between the given depths.
	Always return a real colormap, not nil; this allows the client to get an
	identity colormap that can then be copied and modified to do color
	transformations. "
	"Note: This method returns a shared, cached colormap to save time
	and space. Clients that need to modify a colormap returned by this
	method should make a copy and modify that!"
	"Note: The colormap cache may be cleared by evaluating 'Color
	shutDown'. "
	| _gsSqueakTemp_srcIndex _gsSqueakTemp_map |
	CachedColormaps class == Array
		ifFalse: [CachedColormaps := (1 to: 9)
						collect: [:i | Array new: 32]].
	_gsSqueakTemp_srcIndex := sourceDepth.
	sourceDepth > 8
		ifTrue: [_gsSqueakTemp_srcIndex := 9].
	(_gsSqueakTemp_map := (CachedColormaps at: _gsSqueakTemp_srcIndex)
					at: destDepth) ~~ nil
		ifTrue: [^ _gsSqueakTemp_map].
	_gsSqueakTemp_map := self computeColormapFrom: sourceDepth to: destDepth.
	(CachedColormaps at: _gsSqueakTemp_srcIndex)
		at: destDepth
		put: _gsSqueakTemp_map.
	^ _gsSqueakTemp_map