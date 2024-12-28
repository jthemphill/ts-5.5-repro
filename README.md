# Try to upgrade this repo from TypeScript 5.4

This repo represents our codebase's Bazel sandbox.

You can run the same command that Bazel runs with `./run_bazel.sh`.

Right now, `package.json` specifies `{typescript: "<5.5"}`, and `./run_bazel.sh` exits cleanly.

If you change `package.json` to specify `{typescript: "^5.5"}`, and then run `./run_bazel.sh` again, you should see this error:

```
src/test.spec.ts:1:12 - error TS7017: Element implicitly has an 'any' type because type 'typeof globalThis' has no index signature.

1 globalThis.__IS_CI__ = true;
```

This is the same error that our production codebase gets when we run a `bazel build` command that typechecks our codebase and builds `.d.ts` files.

You can make `test.spec.ts` pass on newer versions of TypeScript by going to `test.spec.ts` and uncommenting the line `import "./common";`. I thought this was intentional! I thought TypeScript was cracking down on module side effects, and requiring that you import the modules before you can rely on the modules' global declarations.
