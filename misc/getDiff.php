<?php


function endsWith($haystack, $needle)
{
    $length = strlen($needle);

    return $length === 0 || 
    (substr($haystack, -$length) === $needle);
}

$res;
exec("git diff --name-only 430a3806529739f7f3657f563465938010b219cd master ./SqueakImport/",$res);

$paths = array();
foreach($res as $line){
    $path = dirname($line);
    if(!endsWith($path,".class") && !endsWith($path,".extension"))
        continue;
    if(isset($argv[1])){
        if(strpos($path, $argv[1]) === false)
            continue;
    }
        
    $paths[] = $path;
}

$uniques = array_unique($paths);


$packages;
foreach($uniques as $unique){
    $matches;
    preg_match('/.*.package/',$unique, $matches);
    if(sizeof($matches) == 0)
        continue;
    $packages[] = $matches[0];
}


$packages = array_unique($packages);
var_dump($packages);

if(sizeof($packages) == 1){
    foreach($uniques as $unique){
        echo $unique . "\n";
    }
}

?>
