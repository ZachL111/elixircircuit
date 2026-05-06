# elixircircuit

`elixircircuit` treats reliability as a local verification problem. The Elixir implementation is intentionally narrow, but the fixtures and notes make the behavior explicit.

## Elixircircuit Checkpoints

Treat the compact fixture as the contract and the extended examples as a scratchpad. The code should stay boring enough that a change in behavior is obvious from the test output.

## Useful Pieces

- Includes extended examples for runbook checks, including `recovery` and `degraded`.
- Documents recovery paths tradeoffs in `docs/operations.md`.
- Runs locally with a single verification command and no external credentials.
- Stores project constants and verification metadata in `metadata/project.json`.
- Adds a repository audit script that checks structure before running the language verifier.

## What This Is For

The goal is to capture the core behavior in code and make the surrounding assumptions obvious. A reader should be able to run the verifier, open the fixtures, and understand why each decision was made.

## Project Layout

- `lib`: library code
- `test`: language test directory
- `fixtures`: compact golden scenarios
- `examples`: expanded scenario set
- `metadata`: project constants and verification metadata
- `docs`: operations and extension notes
- `scripts`: local verification and audit commands

## Architecture Notes

The design is intentionally direct: parse or construct a signal, score it, classify it, and verify the expected branch. This makes the repository useful for studying reliability behavior without needing a service or database unless the language project itself is SQL. The Elixir project uses Mix and ExUnit with clear data maps for each scenario.

## Local Workflow

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

This runs the language-level build or test path against the compact fixture set.

## Case Study

`examples/extended_cases.csv` adds six named cases. I kept the names plain so failures are easy to read in a terminal: baseline, pressure, surge, degraded, recovery, and boundary.

## Quality Gate

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/audit.ps1
```

The audit command checks repository structure and README constraints before it delegates to the verifier.

## Scope

The examples cover useful edges, not every edge. A larger version would add malformed-input tests, richer reports, and deeper domain parsers.

## Expansion Ideas

- Add malformed input fixtures so the failure path is as visible as the happy path.
- Split the scoring constants into a typed configuration object and validate it before use.
- Add a comparison mode that shows how decisions change when one signal is adjusted.
- Add one more reliability fixture that focuses on a malformed or borderline input.

## Tooling

The only required setup is the local Elixir toolchain. After cloning, stay in the repo root so fixture paths resolve correctly.
