as yet unclassified
createIndex
  "  ImdbName names indexSpec removeIndexesFrom: ImdbName names."

  IndexManager autoCommit: true.
  IndexManager sessionAutoCommit: true.
  IndexManager current dirtyObjectCommitThreshold: 1000.
  IndexManager removeAllIndexesOn: Names.
  GsIndexSpec new
    identityIndex: 'each.birthYear';
    identityIndex: 'each.deathYear';
    createIndexesOn: self names