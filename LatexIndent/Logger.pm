package LatexIndent::Logger;
#	This program is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	(at your option) any later version.
#
#	This program is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
#	See http://www.gnu.org/licenses/.
#
#	Chris Hughes, 2017
#
#	For all communication, please visit: https://github.com/cmhughes/latexindent.pl

use strict;
use warnings;
use Exporter;
use LatexIndent::Switches qw/%switches/;
our @ISA = "LatexIndent::Document"; # class inheritance, Programming Perl, pg 321
our @EXPORT_OK = qw/@logFileLines/;
our @logFileLines;

sub info{
    my $self = shift;
    my $thing = shift;
    if ($thing =~ m/^\*/s){
        $thing =~ s/^\*/INFO:  /s;
        $thing =~ s/^/        /mg;
        $thing =~ s/^\h+INFO/INFO/s;
    } else {
        $thing =~ s/^/       /mg;
    }
    push(@logFileLines,$thing);
    print $thing,"\n" if $switches{screenlog};
}

sub warn{
    my $self = shift;
    my $thing = shift;
    if ($thing =~ m/^\*/s){
        $thing =~ s/^\*/WARN:  /s
    } else {
        $thing =~ s/^/       /mg;
    }
    push(@logFileLines,$thing);
    print $thing,"\n" if $switches{screenlog};
}

sub trace{
    my $self = shift;
    my $thing = shift;
    if ($thing =~ m/^\*/s){
        $thing =~ s/^\*/TRACE: /s
    } else {
        $thing =~ s/^/       /mg;
    }
    push(@logFileLines,$thing);
    print $thing,"\n" if $switches{screenlog};
}

1;
