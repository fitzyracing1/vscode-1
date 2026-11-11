// merge-guard trial fixture: depends on a symbol the base branch is
// about to rename. Green on its own head; dark once merged.

import { greet } from "./a";

console.log(greet("merge-guard"));
