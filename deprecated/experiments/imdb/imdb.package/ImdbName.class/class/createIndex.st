as yet unclassified
createIndex
  "  ImdbName names indexSpec removeIndexesFrom: ImdbName names."

  IndexManager autoCommit: true.
  IndexManager current removeAllIndexesOn: Names.
  IndexManager current dirtyObjectCommitThreshold: 100000.
  GsIndexSpec new
    equalityIndex: 'each.birthYear' lastElementClass: SmallInteger;
    createIndexesOn: self names