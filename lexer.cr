require "string_scanner"

module Lexer
  extend self

  alias TokenMap = Hash(String, Regex)

  record Token,
    type : String,
    value : String,
    position : Int32

  def self.lex(token_map : TokenMap, input : String) : Array(Token)
    rgx = Regex.union(token_map.map do |k, v|
      Regex.new "(?<#{k}>#{v.source})"
    end)

    scanner = StringScanner.new(input)

    res = [] of Token

    until scanner.eos?
      pos = scanner.offset
      match = scanner.scan rgx

      raise "No match at #{pos}" unless match

      types = token_map.keys.select do |k|
        scanner[k]?
      end

      res << Token.new(types.first, match, pos)
    end

    res
  end
end
