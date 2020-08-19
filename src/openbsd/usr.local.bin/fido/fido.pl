#!/usr/bin/perl

use strict;
use warnings;

$SIG{USR1} = sub { system("ssh-add", "-K") };

while (1) {
	sleep;
}
