{module, test} = QUnit
module \ES7

test 'String#at' (assert)!->
  {at} = core.String
  assert.isFunction at
  # Tests from https://github.com/mathiasbynens/String.prototype.at/blob/master/tests/tests.js
  # String that starts with a BMP symbol
  assert.strictEqual at('abc\uD834\uDF06def', -Infinity), ''
  assert.strictEqual at('abc\uD834\uDF06def' -1), ''
  assert.strictEqual at('abc\uD834\uDF06def' -0), \a
  assert.strictEqual at('abc\uD834\uDF06def' +0), \a
  assert.strictEqual at('abc\uD834\uDF06def' 1), \b
  assert.strictEqual at('abc\uD834\uDF06def' 3), '\uD834\uDF06'
  assert.strictEqual at('abc\uD834\uDF06def' 4), '\uDF06'
  assert.strictEqual at('abc\uD834\uDF06def' 5), \d
  assert.strictEqual at('abc\uD834\uDF06def' 42), ''
  assert.strictEqual at('abc\uD834\uDF06def' Infinity), ''
  assert.strictEqual at('abc\uD834\uDF06def' null), \a
  assert.strictEqual at('abc\uD834\uDF06def' void), \a
  assert.strictEqual at('abc\uD834\uDF06def'), \a
  assert.strictEqual at('abc\uD834\uDF06def' no), \a
  assert.strictEqual at('abc\uD834\uDF06def' NaN), \a
  assert.strictEqual at('abc\uD834\uDF06def' ''), \a
  assert.strictEqual at('abc\uD834\uDF06def' \_), \a
  assert.strictEqual at('abc\uD834\uDF06def' \1), \b
  assert.strictEqual at('abc\uD834\uDF06def', []), \a
  assert.strictEqual at('abc\uD834\uDF06def', {}), \a
  assert.strictEqual at('abc\uD834\uDF06def' -0.9), \a
  assert.strictEqual at('abc\uD834\uDF06def' 1.9), \b
  assert.strictEqual at('abc\uD834\uDF06def' 7.9), \f
  assert.strictEqual at('abc\uD834\uDF06def' 2 ** 32), ''
  # String that starts with an astral symbol
  assert.strictEqual at('\uD834\uDF06def', -Infinity), ''
  assert.strictEqual at('\uD834\uDF06def' -1), ''
  assert.strictEqual at('\uD834\uDF06def' -0), '\uD834\uDF06'
  assert.strictEqual at('\uD834\uDF06def' 0), '\uD834\uDF06'
  assert.strictEqual at('\uD834\uDF06def' 1), '\uDF06'
  assert.strictEqual at('\uD834\uDF06def' 2), 'd'
  assert.strictEqual at('\uD834\uDF06def' 3), 'e'
  assert.strictEqual at('\uD834\uDF06def' 4), 'f'
  assert.strictEqual at('\uD834\uDF06def' 42), ''
  assert.strictEqual at('\uD834\uDF06def' Infinity), ''
  assert.strictEqual at('\uD834\uDF06def' null), '\uD834\uDF06'
  assert.strictEqual at('\uD834\uDF06def' void), '\uD834\uDF06'
  assert.strictEqual at('\uD834\uDF06def' ), '\uD834\uDF06'
  assert.strictEqual at('\uD834\uDF06def' no), '\uD834\uDF06'
  assert.strictEqual at('\uD834\uDF06def' NaN), '\uD834\uDF06'
  assert.strictEqual at('\uD834\uDF06def' ''), '\uD834\uDF06'
  assert.strictEqual at('\uD834\uDF06def' \_), '\uD834\uDF06'
  assert.strictEqual at('\uD834\uDF06def' \1), '\uDF06'
  # Lone high surrogates
  assert.strictEqual at('\uD834abc', -Infinity), ''
  assert.strictEqual at('\uD834abc' -1), ''
  assert.strictEqual at('\uD834abc' -0), '\uD834'
  assert.strictEqual at('\uD834abc' 0), '\uD834'
  assert.strictEqual at('\uD834abc' 1), \a
  assert.strictEqual at('\uD834abc' 42), ''
  assert.strictEqual at('\uD834abc' Infinity), ''
  assert.strictEqual at('\uD834abc' null), '\uD834'
  assert.strictEqual at('\uD834abc' void), '\uD834'
  assert.strictEqual at('\uD834abc'), '\uD834'
  assert.strictEqual at('\uD834abc' no), '\uD834'
  assert.strictEqual at('\uD834abc' NaN), '\uD834'
  assert.strictEqual at('\uD834abc' ''), '\uD834'
  assert.strictEqual at('\uD834abc' \_), '\uD834'
  assert.strictEqual at('\uD834abc' \1), \a
  # Lone low surrogates
  assert.strictEqual at('\uDF06abc', -Infinity), ''
  assert.strictEqual at('\uDF06abc' -1), ''
  assert.strictEqual at('\uDF06abc' -0), '\uDF06'
  assert.strictEqual at('\uDF06abc' 0), '\uDF06'
  assert.strictEqual at('\uDF06abc' 1), \a
  assert.strictEqual at('\uDF06abc' 42), ''
  assert.strictEqual at('\uDF06abc' Infinity), ''
  assert.strictEqual at('\uDF06abc' null), '\uDF06'
  assert.strictEqual at('\uDF06abc' void), '\uDF06'
  assert.strictEqual at('\uDF06abc'), '\uDF06'
  assert.strictEqual at('\uDF06abc' no), '\uDF06'
  assert.strictEqual at('\uDF06abc' NaN), '\uDF06'
  assert.strictEqual at('\uDF06abc' ''), '\uDF06'
  assert.strictEqual at('\uDF06abc' \_), '\uDF06'
  assert.strictEqual at('\uDF06abc' \1), \a
  assert.strictEqual at(42 0), \4
  assert.strictEqual at(42 1), \2
  assert.strictEqual at({toString: -> \abc}, 2), \c
  if STRICT
    assert.throws (!-> at null, 0), TypeError
    assert.throws (!-> at void, 0), TypeError