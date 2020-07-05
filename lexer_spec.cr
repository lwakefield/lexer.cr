require "spec"

require "./lexer.cr"

describe "Lexer.lex" do
  it "Correctly returns tokens" do
    token_map = {
      "def"        => /def/,
      "end"        => /end/,
      "identifier" => /\w+/,
      "number"     => /\d+/,
      "lparen"     => /\(/,
      "rparen"     => /\)/,
      "plus"       => /\+/,
      "whitespace" => /\s+/,
    }
    Lexer.lex(token_map, "def inc (a) a + 1 end").should eq [
      Lexer::Token.new("def", "def", 0),
      Lexer::Token.new("whitespace", " ", 3),
      Lexer::Token.new("identifier", "inc", 4),
      Lexer::Token.new("whitespace", " ", 7),
      Lexer::Token.new("lparen", "(", 8),
      Lexer::Token.new("identifier", "a", 9),
      Lexer::Token.new("rparen", ")", 10),
      Lexer::Token.new("whitespace", " ", 11),
      Lexer::Token.new("identifier", "a", 12),
      Lexer::Token.new("whitespace", " ", 13),
      Lexer::Token.new("plus", "+", 14),
      Lexer::Token.new("whitespace", " ", 15),
      Lexer::Token.new("identifier", "1", 16),
      Lexer::Token.new("whitespace", " ", 17),
      Lexer::Token.new("end", "end", 18),
    ]
  end
end
