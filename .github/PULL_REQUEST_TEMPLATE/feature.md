### Summary

Describe the new sigil.wz feature and the user-facing icon workflow it enables.

### Motivation

Explain why this belongs in sigil.wz. Focus on icon lookup, aliases, colors,
fallback behavior, symbols, or WezTerm format-ready segments.

### API Sketch

```lua
-- show intended lookup, override, symbol, items, or setup usage
```

### Behavior

Describe how the feature behaves, including default entries, aliases, colors,
fallback behavior, formatting options, symbols, and failure cases.

### Compatibility

- [ ] Non-breaking
- [ ] Potentially breaking
- [ ] Breaking

If this is potentially breaking or breaking, explain the migration path.

### Tests

Describe the tests added or updated for this behavior.

### Documentation

Describe the README, examples, annotation, or template changes made for this
feature.

### Checklist

- [ ] The change is scoped to sigil.wz.
- [ ] Public API changes are documented, if applicable.
- [ ] Icon, alias, color, symbol, or formatting behavior is covered by tests, if applicable.
- [ ] Existing icon keys and aliases remain compatible.
- [ ] Required checks pass:
  - [ ] `busted --verbose`
  - [ ] `luacheck .`
  - [ ] `stylua --check .`
  - [ ] `selene --display-style=quiet .`

