package StaticJukebox;

use Moose;
use Modern::Perl;
use Data::Dumper;
use File::Slurp;
use File::HomeDir;

use StaticJukebox::Artist;

with 'MooseX::SimpleConfig';
with 'MooseX::Getopt';
 
has 'source' => (
    is => 'ro',
    isa => 'Str',
    required => 1,
    documentation => 'Where to find the original audio files.',
);

has 'target' => (
    is => 'ro',
    isa => 'Str',
    required => 1,
    documentation => 'Where to put HTML and converted audio and files.',
);

has 'metadir' => (
    is => 'ro',
    isa => 'Str',
    default => File::HomeDir->my_home . '/.staticjukebox/',
    documentation => 'Path to directory where configs and metadata will be kept. If this is not provided, ~/.staticjukebox/ will be used.',
);

has 'configfile' => (
    is => 'ro',
    isa => 'Str',
    default => File::HomeDir->my_home . '/.staticjukebox/config.yaml',
);

has 'verbose' => (
    is => 'rw',
    isa => 'Bool',
    default => 0,
    documentation => 'More output.',
);

has 'debug' => (
    is => 'rw',
    isa => 'Bool',
    default => 0,
    documentation => 'Even more output.',
);

sub scan {

    my $self = shift;
    my @artist_dirs = read_dir( $self->{'source'} );
    foreach my $artist_dir ( @artist_dirs ) {
        my $artist = StaticJukebox::Artist->new(
            name => $artist_dir,
            dir  => $self->{'source'} . $artist_dir . '/',
        );
        $artist->say_name;
        $artist->scan_albums( $self->{'source'} );
    }

}

no Moose;
__PACKAGE__->meta->make_immutable;

1;
