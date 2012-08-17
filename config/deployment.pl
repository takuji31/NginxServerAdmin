use File::Spec;
use File::Basename qw(dirname);
my $basedir = File::Spec->rel2abs(File::Spec->catdir(dirname(__FILE__), '..'));
+{
    server_config_path => File::Spec->catfile($basedir, '/config/server.yaml'),
};
