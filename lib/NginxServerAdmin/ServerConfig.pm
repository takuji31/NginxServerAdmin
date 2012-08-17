package NginxServerAdmin::ServerConfig;
use strict;
use warnings;
use 5.010_001;

use Smart::Args;
use Amon2;

use File::Spec;
use File::Slurp;
use YAML::Syck;
use Encode;


sub server_conf_path {
    return Amon2->context()->config->{server_config_path};
}

sub new {
    my ($class, ) = @_;
    
    bless {conf => $class->load_config()}, $class;
}

sub load_config {
    local $YAML::Syck::ImplicitUnicode = 1;
    return -e server_conf_path() ? LoadFile(server_conf_path()) : {};
}

sub save {
    my ($self, ) = @_;
    my $conf = $self->{conf};
    my $yaml = Dump($conf);
    $yaml = encode('utf-8', $yaml);
    write_file(server_conf_path(), $yaml);
    return;
}

1;
