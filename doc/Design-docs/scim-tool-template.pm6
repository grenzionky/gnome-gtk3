use v6;
#-------------------------------------------------------------------------------
=begin pod

=TITLE Gnome::LIBRARYMODULE

=SUBTITLE MODULE-SHORTDESCRIPTION

=head1 Description

MODULE-DESCRIPTION

=head2 See Also

MODULE-SEEALSO

=head1 Synopsis
=head2 Declaration

  unit class Gnome::LIBRARYMODULE;
  also is Gnome::LIBRARYPARENT;

=head2 Example

=end pod
#-------------------------------------------------------------------------------
use NativeCall;

use Gnome::N::X;
use Gnome::N::NativeLib;
use Gnome::N::N-GObject;
#use Gnome::GObject::Object;
use Gnome::LIBRARYPARENT;

#-------------------------------------------------------------------------------
# /usr/include/gtk-3.0/gtk/INCLUDE
# /usr/include/glib-2.0/gobject/INCLUDE
# https://developer.gnome.org/WWW
unit class Gnome::LIBRARYMODULE:auth<github:MARTIMM>;
also is Gnome::LIBRARYPARENT;

#-------------------------------------------------------------------------------
my Bool $signals-added = False;
#-------------------------------------------------------------------------------
=begin pod
=head1 Methods
=head2 new

...

  multi method new ( :$widget! )

Create an object using a native object from elsewhere. See also C<Gnome::GObject::Object>.

  multi method new ( Str :$build-id! )

Create an object using a native object from a builder. See also C<Gnome::GObject::Object>.

=end pod

submethod BUILD ( *%options ) {

  $signals-added = self.add-signal-types( $?CLASS.^name,
    ... :type<signame>
  ) unless $signals-added;

  # prevent creating wrong widgets
  return unless self.^name eq 'Gnome::LIBRARYMODULE';

  if ? %options<empty> {
    # ... self.native-gobject(gtk__dialog_new());
  }

  elsif ? %options<widget> || %options<build-id> {
    # provided in GObject
  }

  elsif %options.keys.elems {
    die X::GTK::V3.new(
      :message('Unsupported options for ' ~ self.^name ~
               ': ' ~ %options.keys.join(', ')
              )
    );
  }
}

#-------------------------------------------------------------------------------
# no pod. user does not have to know about it.
method fallback ( $native-sub is copy --> Callable ) {

  my Callable $s;
  try { $s = &::($native-sub); }
  try { $s = &::("BASE_SUBNAME_$native-sub"); } unless ?$s;

#note "ad $native-sub: ", $s;
  $s = callsame unless ?$s;

  $s;
}

SUB_DECLARATIONS

#-------------------------------------------------------------------------------
=begin pod
=head1 Types
=head2

=item

=end pod

#-------------------------------------------------------------------------------
=begin pod
=head1 Signals

Register any signal as follows. See also C<Gnome::GObject::Object>.

  my Bool $is-registered = $my-widget.register-signal (
    $handler-object, $handler-name, $signal-name,
    :$user-option1, ..., $user-optionN
  )


=head2 Supported signals
=head3

=head2 Unsupported signals
=head3

=head2 Not yet supported signals
=head3

SIGNAL-DOC


=begin comment

=head4 Signal Handler Signature

  method handler (
    Gnome::GObject::Object :$widget, :$user-option1, ..., $user-optionN
  )

=head4 Event Handler Signature

  method handler (
    Gnome::GObject::Object :$widget, GdkEvent :$event,
    :$user-option1, ..., $user-optionN
  )

=head4 Native Object Handler Signature

  method handler (
    Gnome::GObject::Object :$widget, N-GObject :$nativewidget,
    :$user-option1, ..., :$user-optionN
  )

=end comment


=head4 Handler Method Arguments
=item $widget; This can be any perl6 widget with C<Gnome::GObject::Object> as the top parent class e.g. C<Gnome::Gtk3::Button>.
=item $event; A structure defined in C<Gnome::Gdk3::EventTypes>.
=item $nativewidget; A native widget (a C<N-GObject>) which can be turned into a perl6 widget using C<.new(:widget())> on the appropriate class.
=item $user-option*; Any extra options given by the user when registering the signal.

=end pod