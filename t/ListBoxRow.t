use v6;
use NativeCall;
use Test;

use Gnome::Gtk3::ListBoxRow;

#use Gnome::N::X;
#Gnome::N::debug(:on);

#-------------------------------------------------------------------------------
my Gnome::Gtk3::ListBoxRow $lb;
#-------------------------------------------------------------------------------
subtest 'ISA test', {
  $lb .= new(:empty);
  isa-ok $lb, Gnome::Gtk3::ListBoxRow, ".new(:empty)";
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
