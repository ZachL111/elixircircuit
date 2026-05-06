# Elixircircuit Walkthrough

This note is the quickest way to read the extra review model in `elixircircuit`.

| Case | Focus | Score | Lane |
| --- | --- | ---: | --- |
| baseline | budget pressure | 132 | watch |
| stress | failure width | 175 | ship |
| edge | recovery gap | 261 | ship |
| recovery | runbook drift | 230 | ship |
| stale | budget pressure | 202 | ship |

Start with `edge` and `baseline`. They create the widest contrast in this repository's fixture set, which makes them better review anchors than the middle cases.

`edge` is the optimistic case; use it to make sure the scoring path still rewards strong signal.
