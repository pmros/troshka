Description
===========
Troshka is an GUI Ruby console. It's an alternative to irb and
other Ruby REPLs. Troshka is written in Ruby and GUI uses Qt bindings.

Troshka is inspired in related projects like [wxirb](https://github.com/emonti/wxirb), [ripl](https://github.com/cldwalker/ripl) and [hotwire](http://code.google.com/p/hotwire-shell).

Sreenshots
==========

Troshka 0.1.0

![Troshka 0.1.0](https://github.com/pmros/troshka/raw/master/screenshots/troshka-0.1.0-01.png)

Features
========
* Code autocompletion (thanks to [Bond](https://github.com/cldwalker/bond)).
* Multiline input.
* Ruby syntax highlight (if [QScintilla](http://www.riverbankcomputing.co.uk/software/qscintilla) is found).
* Code folding (if [QScintilla](http://www.riverbankcomputing.co.uk/software/qscintilla) is found).
* Show array/hash objects like a tree.
* Properties panel.

Requeriments
============
* [QtRuby](https://projects.kde.org/projects/kde/kdebindings/ruby/qtruby).

*QScintilla and Bond are not a requeriment anymore but they are very recommended.*

Install
=======
    gem install troshka

Usage
=====
(Ctrl + Enter) Eval code.

(Ctrl + Space) Autocompletion.

If you double click a code item in output list, code will be copied to code area. It's some kind of history feature.
