test = {
  'name': 'polynomial',
  'points': 1,
  'suites': [
    {
      'type': 'doctest',
      'setup': """
      >>> import hw05
      >>> from hw05 import *
      """,
      'cases': [
        {
          'locked': False,
          'code': """
          >>> str_interval(polynomial(interval(0, 2), [-1, 3, -2]))
          '-3 to 0.125'
          >>> str_interval(polynomial(interval(1, 3), [1, -3, 2]))
          '0 to 10'
          >>> str_interval(polynomial(interval(0.5, 2.25), [10, 24, -6, -8, 3]))
          '18.0 to 23.0'
          """
        }
      ]
    },
    {
      'type': 'doctest',
      'setup': """
      >>> import hw05
      >>> old_abstraction = hw05.interval, hw05.lower_bound, hw05.upper_bound
      >>> hw05.interval = lambda a, b: lambda x: a if x == 0 else b
      >>> hw05.lower_bound = lambda s: s(0)
      >>> hw05.upper_bound = lambda s: s(1)
      >>> from hw05 import *
      """,
      'cases': [
        {
          'locked': False,
          'code': """
          >>> # Testing for abstraction violations
          >>> # Your code should not check for which implementation is used
          >>> str_interval(polynomial(interval(0, 2), [-1, 3, -2]))
          '-3 to 0.125'
          >>> str_interval(polynomial(interval(1, 3), [1, -3, 2]))
          '0 to 10'
          >>> str_interval(polynomial(interval(0.5, 2.25), [10, 24, -6, -8, 3]))
          '18.0 to 23.0'
          """
        },
      ],
      'teardown': """
      >>> hw05.interval, hw05.lower_bound, hw05.upper_bound = old_abstraction
      """
    },
  ]
}
