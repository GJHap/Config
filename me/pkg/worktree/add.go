package worktree

import (
	"os"
	"os/exec"
	"path"
)

func createGitWorktree(repoPath string, worktreePath string) error {
	cmd := exec.Command("git", "worktree", "add", worktreePath)
	cmd.Dir = repoPath

	return cmd.Run()
}

type WorktreeLink struct {
	Source         string
	WorktreeTarget string
}
type WorktreeLinks = []WorktreeLink

func linkFiles(worktreePath string, links WorktreeLinks) error {
	for _, link := range links {
		target := path.Join(worktreePath, link.WorktreeTarget)

		err := os.Symlink(link.Source, target)
		if err != nil {
			return err
		}
	}

	return nil
}

func Add(repoPath string, worktreePath string, links WorktreeLinks) error {
	err := createGitWorktree(repoPath, worktreePath)
	if err != nil {
		return err
	}

	return linkFiles(worktreePath, links)
}
