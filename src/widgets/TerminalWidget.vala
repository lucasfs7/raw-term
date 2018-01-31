public class TerminalWidget : Vte.Terminal {
    GLib.Pid child_pid;
    Gdk.RGBA color_background;
    Gdk.RGBA color_foreground;
    Gdk.RGBA[] color_palette = new Gdk.RGBA[16];

    // default colors
    private string black = "#073642";
    private string red = "#dc322f";
    private string green = "#859900";
    private string yellow = "#b58900";
    private string blue = "#268bd2";
    private string magenta = "#ec0048";
    private string cyan = "#2aa198";
    private string gray = "#94a3a5";
    private string bright_black = "#586e75";
    private string bright_white = "#6c71c4";

    public TerminalWidget (Gdk.RGBA bgc, Gdk.RGBA fgc) {
        color_background = bgc;
        color_foreground = fgc;

        start_shell ();
        build_color_palette ();
        set_styles ();
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

    protected void build_color_palette () {
        string[] palette = {
            black, red, green, yellow,
            blue, magenta, cyan, gray,
            bright_black, red, green, yellow,
            blue, magenta, cyan, bright_white
        };

        for (int i = 0; i < palette.length; i++) {
            Gdk.RGBA color = Gdk.RGBA();
            color.parse (palette[i]);
            color_palette[i] = color;
        }
    }

    protected void set_styles () {
        set_colors (color_foreground, color_background, color_palette);
        set_allow_bold (true);
        margin = 20;
    }
}
