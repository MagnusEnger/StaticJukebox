package StaticJukebox::Album;

use Moose;
use Modern::Perl;
use Data::Dumper;
use File::Slurp;

use StaticJukebox::Track;

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
    say "\t" . $self->name . " <" . $self->dir . ">";

}

sub scan_tracks {

    my ( $self ) = @_;
    my @track_names = read_dir( $self->dir );
    foreach my $track_name ( sort @track_names ) {
        my $track = StaticJukebox::Track->new(
            name => $track_name,
            path => $self->dir . $track_name,
        );
        $track->say_name;
    }

}

no Moose;
__PACKAGE__->meta->make_immutable;

1;
