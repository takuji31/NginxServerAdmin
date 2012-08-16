package NginxServerAdmin;
use strict;
use warnings;
use utf8;
use parent qw/Amon2/;
our $VERSION='0.01';
use 5.008001;

use NginxServerAdmin::ServerConfig;

sub server_config {
    my ($self, ) = @_;
    $self->{server_config} //= NginxServerAdmin::ServerConfig->new;
}

sub save_config {
    my ($self, ) = @_;
    $self->server_config->save;
}

1;
