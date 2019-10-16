#TL:1:Gnome::Gtk3::ColorChooserDialog:

use v6;
#-------------------------------------------------------------------------------
=begin pod

=head1 Gnome::Gtk3::ColorChooserDialog

A dialog for choosing colors

![](images/colorchooser.png)

=head1 Description

The B<Gnome::Gtk3::ColorChooserDialog> widget is a dialog for choosing
a color. It implements the B<Gnome::Gtk3::ColorChooser> interface.

Since: 3.4

=head2 Implemented Interfaces

Gnome::Gtk3::ColorChooserDialog implements
=item Gnome::Atk::ImplementorIface
=item Gnome::Gtk3::Buildable
=item Gnome::Gtk3::ColorChooser

=head2 See Also

B<Gnome::Gtk3::ColorChooser>, B<Gnome::Gtk3::Dialog>

=head1 Synopsis
=head2 Declaration

  unit class Gnome::Gtk3::ColorChooserDialog;
  also is Gnome::Gtk3::Dialog;

=head2 Example

  my Gnome::Gtk3::ColorChooserDialog $dialog .= new(
    :title('my color dialog')
  );

=end pod
#-------------------------------------------------------------------------------
use NativeCall;

use Gnome::N::X;
use Gnome::N::NativeLib;
use Gnome::N::N-GObject;
use Gnome::Gtk3::Dialog;

#-------------------------------------------------------------------------------
# /usr/include/gtk-3.0/gtk/INCLUDE
# https://developer.gnome.org/WWW
unit class Gnome::Gtk3::ColorChooserDialog:auth<github:MARTIMM>;
also is Gnome::Gtk3::Dialog;

#-------------------------------------------------------------------------------
=begin pod
=head1 Methods
=head2 new

Create a new object with a title. The transient $parent-window which may be C<Any>.

  multi method new ( Str :$title!, Gnome::GObject::Object :$parent-window )

Create an object using a native object from elsewhere. See also B<Gnome::GObject::Object>.

  multi method new ( Gnome::GObject::Object :$widget! )

Create an object using a native object from a builder. See also B<Gnome::GObject::Object>.

  multi method new ( Str :$build-id! )

=end pod

#TM:1:new(:title,:parent-window):
#TM:0:new(:widget):
#TM:0:new(:build-id):

submethod BUILD ( *%options ) {

  # prevent creating wrong widgets
  return unless self.^name eq 'Gnome::Gtk3::ColorChooserDialog';

  # process all named arguments
  if ? %options<title> {
    self.native-gobject(gtk_color_chooser_dialog_new(
      %options<title>, %options<parent-window>)
    );
  }

  elsif ? %options<widget> || %options<build-id> {
    # provided in Gnome::GObject::Object
  }

  elsif %options.keys.elems {
    die X::Gnome.new(
      :message('Unsupported options for ' ~ self.^name ~
               ': ' ~ %options.keys.join(', ')
              )
    );
  }

  # only after creating the widget, the gtype is known
  self.set-class-info('GtkColorChooserDialog');
}

#-------------------------------------------------------------------------------
# no pod. user does not have to know about it.
method _fallback ( $native-sub is copy --> Callable ) {

  my Callable $s;
  try { $s = &::($native-sub); }
  try { $s = &::("gtk_color_chooser_dialog_$native-sub"); } unless ?$s;

  # search in the interface modules, name all interfaces which are implemented
  # for this module. not implemented ones are skipped.
  if !$s {
    $s = self._query_interfaces(
      $native-sub, <
        Gnome::Atk::ImplementorIface Gnome::Gtk3::Buildable
        Gnome::Gtk3::ColorChooser
      >
    );
  }

  self.set-class-name-of-sub('GtkColorChooserDialog');
  $s = callsame unless ?$s;

  $s;
}

#-------------------------------------------------------------------------------
=begin pod
=head2 gtk_color_chooser_dialog_new

Creates a new native C<Gtk3ColorChooserDialog>.

Returns: a new B<Gnome::Gtk3::ColorChooserDialog>

Since: 3.4

  method gtk_color_chooser_dialog_new (
    Str $title, N-GObject $parent
    --> N-GObject
  )

=item Str $title;  (allow-none): Title of the dialog, or %NULL
=item N-GObject $parent;  (allow-none): Transient parent of the dialog, or %NULL

=end pod

sub gtk_color_chooser_dialog_new (  str $title,  N-GObject $parent )
  returns N-GObject
  is native(&gtk-lib)
  { * }

#-------------------------------------------------------------------------------
=begin pod
=head1 Properties

An example of using a string type property of a B<Gnome::Gtk3::Label> object. This is just showing how to set/read a property, not that it is the best way to do it. This is because a) The class initialization often provides some options to set some of the properties and b) the classes provide many methods to modify just those properties. In the case below one can use B<new(:label('my text label'))> or B<gtk_label_set_text('my text label')>.

  my Gnome::Gtk3::Label $label .= new(:empty);
  my Gnome::GObject::Value $gv .= new(:init(G_TYPE_STRING));
  $label.g-object-get-property( 'label', $gv);
  $gv.g-value-set-string('my text label');

=head2 Supported properties

=comment #TP:0:show-editor:
=head3 Show editor

Show editor
Default value: False


The B<Gnome::GObject::Value> type of property I<show-editor> is C<G_TYPE_BOOLEAN>.
=end pod
