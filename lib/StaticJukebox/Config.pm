package StaticJukebox::Config;

use YAML::Syck;
use Modern::Perl;
use Exporter 'import';
our @EXPORT_OK = qw(
    config
);

sub config {

    my ( $dir ) = @_;
    my $config_file = $dir . 'config.yaml';
    
    # Check that the given file exists
    if ( !-e $config_file ) {
        say "The file $config_file does not exist, going to create it...";
        # TODO Check if the directory exists, if not create it
        # TODO Ask for the config variables
        # TODO Write the config to the file
        # TODO Return the config we just created
    } else {
        say "The file $config_file does exist, going to use it...";
        my $config = LoadFile( $config_file );
        # TODO Check that the contents of the config make sense, all dirs
        # exist and have the right permissions etc
        return $config;
    }

}

1;
