# git dot

A bash function that will pipe the output of git log
through awk to produce a dot file.

The graph is then rendered as a pdf.

Requires graphviz.

| Operating System | Command |
|-----------------|--------|
|macOS            | brew install graphviz |
|GNU/Linux        | apt install graphviz  |

To install git dot:

    install -v -m 0755 git-dot $(dirname $(which git))
  
Try it out:

    git dot --since=2010-10-01 --branches=*

    git dot --branches=*
