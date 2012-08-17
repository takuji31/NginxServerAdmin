use strict;
use warnings;
use utf8;
use Test::More;
use Test::Exception;
use t::Util;

subtest "first_load" => sub {
    bootstrap {
        my $c = shift;
        my $config = $c->server_config;
        ok $config, 'config instance created';
        isa_ok $config => 'NginxServerAdmin::ServerConfig', 'ServerConfig instance';
        is_deeply $config->{conf} => {}, 'Empty config';
    };
};

subtest "save and load" => sub {
    bootstrap {
        my $c = shift;
        my $config = $c->server_config;
        is_deeply $config->{conf} => {}, 'Empty config';
        $config->{conf}->{hoge} = 'fuga';
        $config->save;
    };

    bootstrap {
        my $config = $c->server_config;
        is_deeply $config->{conf} => {hoge => 'fuga'}, 'Config saved';
    };
};

done_testing;
