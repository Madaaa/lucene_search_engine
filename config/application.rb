require "bundler"
Bundler.setup(:default)
Bundler.require(:default)
$LOAD_PATH.unshift File.expand_path("../../app", __FILE__)

require 'active_support/all'
require 'classes/document_parsers/parser'
require 'classes/document_parsers/pdf'
require 'classes/document_parsers/txt'
require 'classes/document_parsers/xml'
require 'classes/romanian_analyzer'
require 'classes/client'

