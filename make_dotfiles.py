# Python script to intelligently link dotfiles to this directory

def Ask(text, default):
    """Queries the user with text, with default value set to true/false."""
    if type(default) != bool: raise TypeError("no appropriate default value provided.")

    def_rep = ('n', 'y')
    if default == True:
        def_rep = ('y', 'n')
        text = "{0} [Y/n] ".format(text)
    else: text = "{0} [N/y] ".format(text)

    response = input(text)

    if response == '' or response.lower()[0] == def_rep[0]: return default
    elif response.lower()[0] == def_rep[1]: return not(default)
    else: return Ask(text, default)

def LinkFiles(origin, dest, exclude = [], dot = False):
    """Links files from origin to destination."""
    from os.path import isfile,isdir,join,islink
    from os.path import split as path_split
    from os import mkdir,unlink,symlink
    from glob import glob

    for f in glob(join(origin, '*')):
        if f in exclude: continue

        tmp_orig = f

        f = path_split(f)[1]
        if dot: f = '.{0}'.format(f)

        tmp_dest = join(dest, f)

        # For files
        if isfile(tmp_orig):
            if isfile(tmp_dest):
                if islink(tmp_dest) or Ask("File {0} exists...link anyway?".format(tmp_dest), default = False):
                    unlink(tmp_dest)
                else: continue
            symlink(tmp_orig, tmp_dest)

        # For directories, create the directory tree in case some file is needed in there
        elif isdir(tmp_orig):
            if not(isdir(tmp_dest)): mkdir(tmp_dest)
            # Link files in the destination directory to existing files in our directory
            LinkFiles(tmp_orig, tmp_dest)

if __name__ == '__main__':
    from glob import glob
    from sys import path,argv
    from os.path import join,splitext,expanduser,basename

    origin = path[0]
    dest = expanduser('~')
    exclude = glob(join(path[0], "{0}.*".format(splitext(basename(argv[0]))[0])))
    LinkFiles(origin = origin, dest = dest, exclude = exclude, dot = True)
