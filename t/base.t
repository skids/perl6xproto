use v6;
use lib './lib';

use Test;

plan 7;

use X::Protocol;
ok(1,'We use X::Protocol and we are still alive');
lives_ok { X::Protocol.new(:404status :protocol<HTTP>) }, "Can create a simple one-off";
dies_ok { X::Protocol.new(:404status) }, "Cannot create a one-off without :protocol()";
is X::Protocol.new(:404status :protocol<HTTP>).message, "HTTP error: 404", "Simple one-shot has correct message";
is X::Protocol.new(:404status :protocol<HTTP>).gist, "HTTP error: 404", "Simple one-shot has correct gist";
is X::Protocol.new(:404status :protocol<HTTP> :human<Oops>).message, "HTTP error: 404 -- Oops", "One-shot use supports human text";
is X::Protocol.new(:404status :protocol<HTTP> :human<Oops>).Str, "404", "One-shot Str method is just .status";
