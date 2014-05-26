package StaticJukebox::Artist;

use Moose;
use Modern::Perl;
use Data::Dumper;
use File::Slurp;

use StaticJukebox::Album;

has 'name' => (
    is  => 'rw',
    isa => 'Str',
);

has 'dir' => (
    is  => 'ro',
    isa => 'Str',
);

sub say_name {

    my $self = shift;
    say $self->name . " <" . $self->dir . ">";

}

sub scan_albums {

    my ( $self ) = @_;
    my @album_dirs = read_dir( $self->dir );
    foreach my $album_dir ( @album_dirs ) {
        my $album = StaticJukebox::Album->new(
            name => $album_dir,
            dir  => $self->dir . $album_dir . '/',
        );
        $album->say_name;
        $album->scan_tracks;
    }

}

no Moose;
__PACKAGE__->meta->make_immutable;

1;
