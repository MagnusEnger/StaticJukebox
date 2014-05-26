package StaticJukebox::Artist;

use Moose;
use Modern::Perl;
use Data::Dumper;
use File::Slurp;
use File::Spec;

use StaticJukebox::Album;

has 'name' => (
    is  => 'rw',
    isa => 'Str',
);

has 'rel_dir' => (
    is  => 'ro',
    isa => 'Str',
);

has 'dir' => (
    is  => 'ro',
    isa => 'Str',
);

sub say_name {

    my $self = shift;
    say $self->name . " <" . $self->rel_dir . "> <" . $self->dir . ">";

}

sub scan_albums {

    my ( $self ) = @_;
    my @album_dirs = read_dir( $self->dir );
    foreach my $album_dir ( @album_dirs ) {
        my $album = StaticJukebox::Album->new(
            name    => $album_dir,
            rel_dir => File::Spec->catdir( $self->name, $album_dir ),
            dir     => File::Spec->catdir( $self->dir, $album_dir ),
        );
        $album->say_name;
        $album->scan_tracks;
    }

}

sub check_dir {

    my ( $self, $metadir, $target ) = @_;
    
    my $this_metadir = File::Spec->catdir( $metadir, $self->{'rel_dir'} );
    if ( !-e $this_metadir ) {
        say "Have to create $this_metadir";
    }

    my $this_target = File::Spec->catdir( $target, $self->{'rel_dir'} );
    if ( !-e $this_target ) {
        say "Have to create $this_target";
    }

}

no Moose;
__PACKAGE__->meta->make_immutable;

1;
