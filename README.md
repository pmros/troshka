Description
===========
Troshka is an GUI Ruby console. It's an alternative to irb and
other Ruby REPLs. Troshka is written in Ruby and GUI uses Qt bindings.

Troshka is inspired in related projects like [wxirb](https://github.com/emonti/wxirb), [ripl](https://github.com/cldwalker/ripl) and [hotwire](http://code.google.com/p/hotwire-shell).

Features
========
* Code autocompletion (thanks to [Bond](https://github.com/cldwalker/bond)).
* Multiline input.
* Ruby syntax highlight (thanks to [QScintilla](http://www.riverbankcomputing.co.uk/software/qscintilla)).
* Code folding (thanks to [QScintilla](http://www.riverbankcomputing.co.uk/software/qscintilla)).
* Show array/hash objects like a tree.

Requeriments
============
* [QtRuby](https://projects.kde.org/projects/kde/kdebindings/ruby/qtruby).
* [QScintilla](http://www.riverbankcomputing.co.uk/software/qscintilla) for code editor.
* [Bond](https://github.com/cldwalker/bond) for code completion.

Install
=======
    gem install troshka

Usage
=====
(Ctrl + Intro) Eval code.

(Ctrl + Space) Autocompletion.

If you double click a code item in output list, code will be copied to code area. It's some kind of history feature.