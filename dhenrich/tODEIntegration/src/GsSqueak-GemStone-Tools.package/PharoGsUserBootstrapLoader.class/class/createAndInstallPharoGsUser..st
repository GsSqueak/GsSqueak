installation
createAndInstallPharoGsUser: repositoryUrl
  "self createAndInstallPharoGsUser: self defaultRepositoryUrl"

  | boot |
  boot := self new.
  boot bootstrapFrom: self env2PackageList repositorySpec: repositoryUrl.
  boot
    bootstrapFrom: self env0PackageList
    repositorySpec: repositoryUrl
    compilationSymbolList: System myUserProfile symbolList
    lookupSymbolList: boot symbolList
    envId: boot sessionMethodEnvironment