use strict;
use warnings;
use utf8;
use Test::More;

use_ok $_ for qw(
    NginxServerAdmin
    NginxServerAdmin::Web
    NginxServerAdmin::Web::Dispatcher
);

done_testing;
