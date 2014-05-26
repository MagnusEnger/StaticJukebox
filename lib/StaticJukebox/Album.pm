package StaticJukebox::Album;

use Moose;
use Modern::Perl;
use Data::Dumper;
use File::Slurp;
use File::Spec;
use File::Basename;

use StaticJukebox::Track;

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
    say "\t" . $self->name . " <" . $self->rel_dir . "> <" . $self->dir . ">";

}

sub scan_tracks {

    my ( $self ) = @_;
    my @track_names = read_dir( $self->dir );
    foreach my $track_name ( sort @track_names ) {
        my $rel_path = File::Spec->catfile( $self->rel_dir, $track_name );
        my ( $filename, $directories, $suffix ) = fileparse( $rel_path, qr/\.[^.]*/ );
        my $track = StaticJukebox::Track->new(
            name        => $track_name,
            rel_path    => $rel_path,
            full_path   => File::Spec->catfile( $self->dir, $track_name ),
            directories => $directories,
            filename    => $filename,
            suffix      => $suffix,
        );
        $track->say_name;
    }

}

no Moose;
__PACKAGE__->meta->make_immutable;

1;
