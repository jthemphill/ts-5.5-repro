// Importing `./common` explicitly causes typechecking to work with TypeScript 5.5 and beyond.
// I thought this was intentional! Importing the module is how we prove that the global variable has been set.
// import "./common";

globalThis.__IS_CI__ = true;
