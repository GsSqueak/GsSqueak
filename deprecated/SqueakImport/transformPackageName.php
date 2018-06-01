<?php 

$props = json_decode(file_get_contents($argv[1]));
if(property_exists($props,"category"))
    $props->category = "SqKernelTestsNumbers";
echo json_encode($props);

?>
