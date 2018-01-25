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
        var gtk_settings = Gtk.Settings.get_default ();
        gtk_settings.gtk_application_prefer_dark_theme = false;

        var window_context = get_style_context ();
        var window_state = window_context.get_state ();

        var header = new Gtk.HeaderBar ();
        header.show_close_button = true;

        var header_context = header.get_style_context ();
        header_context.add_class (Gtk.STYLE_CLASS_FLAT);

        Gdk.RGBA background_color = window_context.get_background_color (window_state);
        Gdk.RGBA foreground_color = window_context.get_color (window_state);
        var terminal = new TerminalWidget (background_color, foreground_color);

        set_titlebar (header);
        add (terminal);
    }
}
