public class TerminalWidget : Vte.Terminal {
    GLib.Pid child_pid;
    Gdk.RGBA color_background;
    Gdk.RGBA color_foreground;
    Gdk.RGBA[] color_palette = new Gdk.RGBA[16];

    // default colors
    // black
    private string color00 = "#4a4b4a";
    private string color08 = "#696969";
    // red
    private string color01 = "#D7699A";
    private string color09 = "#F5A2B5";
    // green
    private string color02 = "#80D468";
    private string color10 = "#A3F2A0";
    // yellow
    private string color03 = "#D7A169";
    private string color11 = "#F5CDA2";
    // blue
    private string color04 = "#6985D7";
    private string color12 = "#A2C1F5";
    // magenta
    private string color05 = "#C86AD4";
    private string color13 = "#D2A2F5";
    // cyan
    private string color06 = "#6FCCD1";
    private string color14 = "#A0E9F2";
    // white
    private string color07 = "#DBDCDC";
    private string color15 = "#FDFDFD";

    public TerminalWidget (Gdk.RGBA bgc, Gdk.RGBA fgc) {
        color_background = bgc;
        color_foreground = fgc;

        start_shell ();
        build_color_palette ();
        set_styles ();
    }

    protected void start_shell () {
        string shell = Vte.get_user_shell ();
        string dir = Environment.get_home_dir ();

        try {
            spawn_sync (
                Vte.PtyFlags.DEFAULT,
                dir,
                { shell },
                null,
                SpawnFlags.SEARCH_PATH,
                null,
                out this.child_pid,
                null
            );
        } catch (Error e) {
            warning (e.message);
        }
    }

    protected void build_color_palette () {
        string[] palette = {
            color00, color01, color02, color03,
            color04, color05, color06, color07,
            color08, color09, color10, color11,
            color12, color13, color14, color15,
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
        set_font_scale (1.2);
        margin = 10;
    }
}
