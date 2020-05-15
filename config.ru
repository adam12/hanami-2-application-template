# frozen_string_literal: true

require "rack/static"
use Rack::Static,
  urls: ["/assets"],
  root: ".assets/tmp",
  header_rules: [
    ["/assets",  {"Cache-Control" => "no-store"}]
  ],
  cascade: true if File.directory?(".assets/tmp")

use Rack::Static,
  urls: ["/assets"],
  root: "public",
  header_rules: [
    ["/assets", {"Cache-Control" => "public, max-age=31536000"}]
  ]

require "hanami/boot"
run Hanami.app
