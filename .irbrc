require 'rubygems'
require 'activesupport'
require 'pp'
require 'irb/completion' # メソッド補完
require 'what_methods' # what? でメソッドを調べる
require 'wirble' # カラーリングの設定

IRB.conf[:AUTO_INDENT]=true
IRB.conf[:SAVE_HISTORY]=200

Wirble.init
Wirble.colorize
