<?php
header('Content-Type: video/MP2T');
header("Content-Disposition: attachment; filename=video.ts");
echo file_get_contents($_GET["url"]);
/*play($_GET["url"]);

function play($url){
ini_set('memory_limit', '1024M');
set_time_limit(3600);
ob_start();
if (isset($_SERVER['HTTP_RANGE'])) $opts['http']['header'] = "Range: " . $_SERVER['HTTP_RANGE'];
$opts['http']['method'] = "HEAD";
$conh = stream_context_create($opts);
$opts['http']['method'] = "GET";
$cong = stream_context_create($opts);
$out[] = file_get_contents($url, false, $conh);
$out[] = $httap_response_header;
ob_end_clean();
array_map("header", $http_response_header);
readfile($url, false, $cong);
}
 */
