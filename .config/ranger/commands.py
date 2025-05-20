import os

from ranger.ext.signals import SignalDispatcher
from ranger.api.commands import Command
from plugins.ranger_udisk_menu.mounter import mount


class AVFSStatic(Command):
    def __init__(self, *args, **kwargs):
        Command.__init__(self, *args, **kwargs)
        
        self.avfs_path = os.path.expanduser("~/.avfs")
        
    def _mountavfs(self):
        if not os.path.ismount(self.avfs_path):
            self.fm.execute_command("mountavfs")
            
        return os.path.ismount(self.avfs_path)
    
class avfs(AVFSStatic):
    """
    :avfs_open

    Open an archive using avfs. If avfs is not mounted for the current
    user (in ~/.avfs), it is mounted on first call.
    """
        
    def _return(self):
        if not os.path.abspath(self.fm.thisfile.path).startswith(self.avfs_path + self.archive_path + "#"):
            self.fm.signal_unbind(self.handler)
            self.fm.select_file(self.archive_path)
            
    
    def execute(self):
        if not self._mountavfs():
            self.fm.notify("avfs is not available and could not be mounted", bad=True)
            return
            
        self.archive_path = os.path.abspath(self.fm.thisfile.path)
        self.fm.cd(self.avfs_path + self.archive_path + "#/")
        self.handler = self.fm.signal_bind('cd', self._return)
        
class avfs_remount(AVFSStatic):
    """
    :avfs_remount

    (Re)mount the avfs directory.
    """  
    
    def execute(self):
        self.fm.execute_command("umountavfs")
        if not self._mountavfs():
            self.fm.notify("avfs is not available and could not be mounted", bad=True)
            return


class fzf_select(Command):
    """
    :fzf_select
    Find a file using fzf.
    With a prefix argument to select only directories.

    See: https://github.com/junegunn/fzf
    """

    def execute(self):
        import subprocess
        import os
        from ranger.ext.get_executables import get_executables

        if 'fzf' not in get_executables():
            self.fm.notify('Could not find fzf in the PATH.', bad=True)
            return

        fd = None
        if 'fdfind' in get_executables():
            fd = 'fdfind'
        elif 'fd' in get_executables():
            fd = 'fd'

        if fd is not None:
            hidden = ('--hidden' if self.fm.settings.show_hidden else '')
            exclude = "--no-ignore-vcs --exclude '.git' --exclude '*.py[co]' --exclude '__pycache__'"
            only_directories = ('--type directory' if self.quantifier else '')
            fzf_default_command = '{} --follow {} {} {} --color=always'.format(
                fd, hidden, exclude, only_directories
            )
        else:
            hidden = ('-false' if self.fm.settings.show_hidden else r"-path '*/\.*' -prune")
            exclude = r"\( -name '\.git' -o -name '*.py[co]' -o -fstype 'dev' -o -fstype 'proc' \) -prune"
            only_directories = ('-type d' if self.quantifier else '')
            fzf_default_command = 'find -L . -mindepth 1 {} -o {} -o {} -print | cut -b3-'.format(
                hidden, exclude, only_directories
            )

        env = os.environ.copy()
        env['FZF_DEFAULT_COMMAND'] = fzf_default_command
        env['FZF_DEFAULT_OPTS'] = '--height=40% --layout=reverse --ansi --preview="{}"'.format('''
            (
                batcat --color=always {} ||
                bat --color=always {} ||
                cat {} ||
                tree -ahpCL 3 -I '.git' -I '*.py[co]' -I '__pycache__' {}
            ) 2>/dev/null | head -n 100
        ''')

        fzf = self.fm.execute_command('fzf --no-multi', env=env,
                                      universal_newlines=True, stdout=subprocess.PIPE)
        stdout, _ = fzf.communicate()
        if fzf.returncode == 0:
            selected = os.path.abspath(stdout.strip())
            if os.path.isdir(selected):
                self.fm.cd(selected)
            else:
                self.fm.select_file(selected)

