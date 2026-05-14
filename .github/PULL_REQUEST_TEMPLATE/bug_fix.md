### Summary

Describe the bug fixed in sigil.wz and the user-visible icon or formatting
behavior that changed.

### Reproduction

Provide the smallest setup that reproduced the issue.

```lua
-- icon lookup, override, symbol, or format usage that reproduced the bug
```

### Root Cause

Explain why registry lookup, alias resolution, fallback handling, color output,
symbol lookup, or WezTerm format item generation was wrong.

### Fix

Describe the implementation change and why it fixes the problem.

### Regression Test

Describe the regression test added or updated.

### Compatibility Impact

- [ ] Non-breaking
- [ ] Potentially breaking
- [ ] Breaking

If this changes behavior intentionally, explain why the new behavior is correct.

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

