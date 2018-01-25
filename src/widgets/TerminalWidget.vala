public class TerminalWidget : Vte.Terminal {
    GLib.Pid child_pid;
    Gdk.RGBA background_color;
    Gdk.RGBA foreground_color;

    public TerminalWidget (Gdk.RGBA bgc, Gdk.RGBA fgc) {
        background_color = bgc;
        foreground_color = fgc;

        start_shell ();
        add_styles ();
    }

    protected void start_shell () {
        string shell = Vte.get_user_shell ();

        spawn_sync (
            Vte.PtyFlags.DEFAULT,
            null,
            { shell },
            null,
            SpawnFlags.SEARCH_PATH,
            null,
            out this.child_pid,
            null
        );
    }

    protected void add_styles () {
        set_color_background (background_color);
        set_color_foreground (foreground_color);
        margin = 20;
    }
}
