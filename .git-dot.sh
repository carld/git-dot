#!/bin/bash

function git-dot () {
  BRANCH=`git branch | grep '*' | sed -e 's/\* \(.*\)/\1/'`

  git log --pretty=format:'%h|%p|%s|%d' $@ | 
    awk -F'|' '
    BEGIN { 
      print "digraph git {"; 
      print "rankdir=BT;";
    }
    {
      gsub(/"/, "", $3)
      print "node"$1 " [label=\"" $3 " " $4 " " "\"];";
      split($2,a," ");
      for (i in a) print "node" a[i] " -> " " node" $1 ";"; 
    }
    END {
      print "}";
    }
    ' > "$BRANCH-graph.dot"

  dot -Tpdf -O "$BRANCH-graph.dot"
}

