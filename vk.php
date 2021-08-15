<?php

header("Content-type: application/x-mpegURL");
header("Content-Disposition: attachment; filename=index.m3u8");
$data = file_get_contents("https://vk.com/video_ext.php?oid=" . $_GET["oid"] . "&id=" . $_GET["id"] . "&hash=" . $_GET["hash"]);
preg_match('/<source src="(.*)" type/m', $data, $matches);
$m3u8 = file_get_contents($matches[1]);
$m3u8 = preg_replace('/(.*index.m3u8)/m', str_replace("video.m3u8?p", "", $matches[1]) . '$1', $m3u8);
preg_match_all('#\bhttps?://[^,\s()<>]+(?:\([\w\d]+\)|([^,[:punct:]\s]|/))#', $m3u8, $m3u8);
$m = file_get_contents($m3u8[0][1]);
echo preg_replace("/(.*?.ts)/", "get.php?url=" . str_replace("index.m3u8", "", $m3u8[0][1]) . "$1", $m);
# echo file_get_contents($m3u8);
