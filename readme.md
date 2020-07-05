lexer.cr
========

A super simple regex based lexer written in Crystal.

```crystal
# precedence defined by order in which keys are defined ie. def has a higher
# precedence than identifier.
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
Lexer.lex(token_map, "def inc (a) a + 1 end")
```

---

Lex away!
