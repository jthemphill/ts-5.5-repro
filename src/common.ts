/**
 * Read environment variables and cache them as globals.
 *
 * Yes, in this case we should just export `__IS_CI__` like normal people.
 * But I'm trying to migrate TypeScript with the minimum amount of churn,
 * and I'm trying to eliminate an entire class of blockers from the migration.
 */

declare global {
  namespace globalThis {
    var __IS_CI__: boolean;
  }
}

// globalThis.__IS_CI__ = process.env.DEPLOYMENT === 'continuous-integration';

export {};
