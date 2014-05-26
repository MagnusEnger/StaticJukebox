package StaticJukebox::Track;

use Moose;
use Modern::Perl;
use Data::Dumper;
use File::Slurp;

has 'name' => (
    is  => 'rw',
    isa => 'Str',
);

has 'rel_path' => (
    is  => 'ro',
    isa => 'Str',
);

has 'path' => (
    is  => 'ro',
    isa => 'Str',
);

sub say_name {

    my $self = shift;
    say "\t\t" . $self->name . " <" . $self->rel_path . "> <" . $self->path . ">";

}

no Moose;
__PACKAGE__->meta->make_immutable;

1;
