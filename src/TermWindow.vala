public class TermWindow : Gtk.Window {
    public TermWindow (Gtk.Application application) {
        Object (
            application: application,
            width_request: 700,
            height_request: 500,
            border_width: 0
        );
    }

    construct {
        var header = new Gtk.HeaderBar ();
        header.show_close_button = true;

        var header_context = header.get_style_context ();
        header_context.add_class (Gtk.STYLE_CLASS_FLAT);

        var terminal = new Vte.Terminal ();

        set_titlebar (header);
        add (terminal);
    }
}
