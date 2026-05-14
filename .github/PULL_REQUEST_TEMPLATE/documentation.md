### Summary

Describe the sigil.wz documentation change.

### Documentation Changed

List the README, examples, contributing guide, issue templates, pull request
templates, or annotation docs changed by this pull request.

### Reader Impact

Explain who benefits from this documentation change:

- Users resolving named icons and colors.
- Users adding overrides or using format-ready segments.
- Contributors changing sigil.wz internals.

### Examples Touched

```lua
-- icon, symbol, items, or setup example changed by this pull request
```

### Behavior Change

- [ ] Documentation only
- [ ] Documents an existing behavior
- [ ] Documents a new behavior

If this documents a new behavior, link to the implementation pull request or
commit.

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

