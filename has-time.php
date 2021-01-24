<?php

const YES="yes";
const NO="no";
const LESS_TAN_15_MINUTES="less-15";

const WEEKEND='Wk';
const WORKDAY='Wd';

if (!$argv[1]) {
    die(YES);
}

$data = explode(';', $argv[1])[3] ?: '|';
$allowedTime = array_map('trim', explode('|', $data));

switch (date('w')) {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
        $pattern = WORKDAY;
        break;
    case 6:
    case 0:
        $pattern = WEEKEND;
        break;
    default:
        $pattern = 'WTF';
}

function isTime($timeString) {
    global $pattern;

    return preg_match("/^{$pattern}/", $timeString);
}

function removePrefix($timeString) {
    global $pattern;

    return str_replace($pattern, '', $timeString);
}

$allowedTime = array_map('removePrefix', array_filter($allowedTime, 'isTime'));

$timeNow = date('Hi');

$isAllowed = NO;

function inRange($timeNow, $timeRange) {
    $timeNow = (int)$timeNow;
    $parts = explode('-', $timeRange);
    $min = (int)$parts[0];
    $max = (int)$parts[1];

    return $timeNow >= $min && $timeNow <= $max;
}

function isLessThan15min($timeNow, $timeRange) {
    $timeNow = (int)$timeNow;
    $parts = explode('-', $timeRange);
    $max = (int)$parts[1];

    return $max - $timeNow <= 15;
}

foreach ($allowedTime as $timeRange) {
    if (inRange($timeNow, $timeRange)) {
        $isAllowed = isLessThan15min($timeNow, $timeRange) ? LESS_TAN_15_MINUTES : YES;
    }
}

die($isAllowed);
