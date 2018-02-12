project('com.github.lucasfs7.raw-term', 'vala', 'c')

gnome = import('gnome')
i18n = import('i18n')

add_global_arguments('-DGETTEXT_PACKAGE="@0@"'.format (meson.project_name()), language:'c')

executable(
    meson.project_name(),
    'src/Application.vala',
    'src/windows/TerminalWindow.vala',
    'src/widgets/TerminalWidget.vala',
    dependencies: [
        dependency('glib-2.0'),
        dependency('gobject-2.0'),
        dependency('gtk+-3.0'),
        dependency('vte-2.91'),
        meson.get_compiler('c').find_library('m', required : false)
    ],
    install: true
)
subdir('data')

meson.add_install_script('meson/post_install.py')
