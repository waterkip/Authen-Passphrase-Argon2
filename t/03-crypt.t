use Test::More;
use Authen::Passphrase::Argon2;

my $ppr = Authen::Passphrase::Argon2->new(
	salt => 'abcdefg123',
	passphrase => 'abc'
);

is($ppr->as_crypt, '$argon2id$v=19$m=32768,t=3,p=1$YWJjZGVmZzEyMw$FmPc1Fhq0MKi1wcuQ1v4ow', 'expected crypt value - argon2');
is($ppr->match('0'), '');
is($ppr->match('abc'), 1);

my $from = Authen::Passphrase::Argon2->from_crypt('$argon2id$v=19$m=32768,t=3,p=1$YWJjZGVmZzEyMw$FmPc1Fhq0MKi1wcuQ1v4ow');

is($from->as_crypt, '$argon2id$v=19$m=32768,t=3,p=1$YWJjZGVmZzEyMw$FmPc1Fhq0MKi1wcuQ1v4ow', 'expected crypt value - argon2');
is($from->match('0'), '');
is($from->match('abc'), 1);

done_testing();
