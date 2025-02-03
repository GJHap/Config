import { promisify } from "node:util";
import child_process from "node:child_process";
import { symlink } from "node:fs/promises";
const exec = promisify(child_process.exec);

function git_worktree(worktree: string) {
   return exec(`git worktree add ${worktree}`);
}

type KeyValuePair = Record<string, string>;
async function exec_kvps(
   kvps: KeyValuePair,
   fn: (src: string, dst: string) => Promise<void>,
) {
   await Promise.all(Object.entries(kvps).map(([src, dst]) => fn(src, dst)));
}

function link_files(files: KeyValuePair) {
   return exec_kvps(files, symlink);
}

export async function create_worktree(
   worktree: string,
   files_to_link: KeyValuePair,
) {
   await git_worktree(worktree);
   await link_files(files_to_link);
}
