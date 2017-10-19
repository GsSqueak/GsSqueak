accessing
pharoGsUser
  ^ pharoGsUser ifNil: [ pharoGsUser := self getNewPharoGsUser ]