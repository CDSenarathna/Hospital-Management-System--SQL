<?php
$pesi="name.txt";
$filee=fopen($pesi,"w");

$enna="hi bn enna kadha";
$punda="oppay  naye";
fwrite($filee,$punda);
fwrite($filee,$enna);
?>