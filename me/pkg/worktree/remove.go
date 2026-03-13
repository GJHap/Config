package worktree

import (
	"os"
	"os/exec"
	"strings"
)

func Remove(repoPath string, worktreePath string) error {
	splitWorktreePath := strings.Split(worktreePath, string(os.PathSeparator))
	worktreeName := splitWorktreePath[len(splitWorktreePath)-1]

	cmd := exec.Command("git", "worktree", "remove", worktreeName, "--force")
	cmd.Dir = repoPath

	return cmd.Run()
}
