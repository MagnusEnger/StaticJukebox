#!/usr/bin/perl 

# Copyright 2014 Magnus Enger Libriotech

=head1 NAME

staticjukebox.pl - Gather reports from logwatch and format as an HTML page.

=head1 SYNOPSIS

    perl staticjukebox.pl -v

=cut

use File::HomeDir;
use DateTime;
use Getopt::Long;
use Data::Dumper;
use Pod::Usage;
use Modern::Perl;

use lib 'lib';
use StaticJukebox::Config qw( config );

my $dt = DateTime->now;
my $date = $dt->ymd;

# Get options
my ( $config_dir, $verbose, $debug ) = get_options();

# Get the config
my $config = config( $config_dir );
say Dumper $config if $debug;

=head1 OPTIONS

=over 4

=item B<-c, --configdir>

Path to the directory where configfiles and metadata will be stored. If this 
argument is not supplied, the default of F<~/.staticjukebox/> will 
be used instead.

=item B<-v --verbose>

More verbose output.

=item B<-d --debug>

Even more verbose output.

=item B<-h, -?, --help>

Prints this help message and exits.

=back
                                                               
=cut

sub get_options {

    # Options
    my $config_dir = File::HomeDir->my_home . '/.staticjukebox/';
    my $limit      = '', 
    my $verbose    = '';
    my $debug      = '';
    my $help       = '';

    GetOptions (
        'c|configdir=s' => \$config_dir,
        'v|verbose'     => \$verbose,
        'd|debug'       => \$debug,
        'h|?|help'      => \$help
    );

    pod2usage( -exitval => 0 ) if $help;

    return ( $config_dir, $verbose, $debug );

}

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
