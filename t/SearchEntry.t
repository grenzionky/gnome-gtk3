use v6;
use NativeCall;
use Test;

use Gnome::Gtk3::SearchEntry;

#use Gnome::N::X;
#Gnome::N::debug(:on);

#-------------------------------------------------------------------------------
my Gnome::Gtk3::SearchEntry $se;
#-------------------------------------------------------------------------------
subtest 'ISA test', {
  $se .= new(:empty);
  isa-ok $se, Gnome::Gtk3::SearchEntry, '.new(:empty)';
}

#`{{
#-------------------------------------------------------------------------------
subtest 'Manipulations', {
}

#-------------------------------------------------------------------------------
subtest 'Inherit ...', {
}

#-------------------------------------------------------------------------------
subtest 'Interface ...', {
}

#-------------------------------------------------------------------------------
subtest 'Properties ...', {
}

#-------------------------------------------------------------------------------
subtest 'Themes ...', {
}

#-------------------------------------------------------------------------------
subtest 'Signals ...', {
}
}}

#-------------------------------------------------------------------------------
done-testing;
