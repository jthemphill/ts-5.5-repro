# Try to upgrade this repo from TypeScript 5.4

This repo reproduces a problem when `--outDir src` is specified.

You can run TypeScript via `pnpm tsc --outDir src`. `run_bazel.sh` will run `pnpm instal

The script `./test.sh` will run TypeScript, showing you that typechecking passes with TypeScript<5.5 and fails with TypeScript>=5.5.

TypeScript is outputting this error:

```
src/test.spec.ts:1:12 - error TS7017: Element implicitly has an 'any' type because type 'typeof globalThis' has no index signature.

1 globalThis.__IS_CI__ = true;
```

You can make `test.spec.ts` pass on all versions of TypeScript by going to `test.spec.ts` and uncommenting the line `import "./common";`. I thought this was intentional! I thought TypeScript was cracking down on module side effects, and requiring that you import the modules before you can rely on the modules' global declarations.

Omitting `--outDir src` from the command line will also cause TypeScript to pass. I don't understand why this should be the case.
