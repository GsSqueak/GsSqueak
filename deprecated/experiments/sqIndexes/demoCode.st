Workspace evaluate: '
|bag|
bag := IndexableBag new: 10.
bag add: (1 to: 4).
bag add: (2 to: 3).

GsIndexSpec new
	equalityIndex: ''each.start'' lastElementClass: SmallInteger;
	createIndexesOn: bag.

bag add: (5 to: 6).

"searching"
^ (GsQuery _env0 fromString: ''each.start < 5'' on: bag) _env0
queryResult.'.
