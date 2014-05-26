#!/usr/bin/perl 

# Copyright 2014 Magnus Enger Libriotech

=head1 NAME

staticjukebox.pl - Gather reports from logwatch and format as an HTML page.

=head1 SYNOPSIS

    perl staticjukebox.pl -v

=cut

use lib 'lib';
use StaticJukebox;
use Modern::Perl;

# Get the config
my $app = StaticJukebox->new_with_options();
$app->scan;

=head1 ARGUMENTS

Run C<perl staticjukebox.pl -h> to see possible arguments.

=head1 AUTHOR

Magnus Enger magnus@enger.priv.no

=head1 LICENSE

    This file is part of StaticJukebox.

    StaticJukebox is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    StaticJukebox is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with StaticJukebox.  If not, see <http://www.gnu.org/licenses/>.

=cut
