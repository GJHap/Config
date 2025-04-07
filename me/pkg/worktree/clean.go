package worktree

import (
	"bufio"
	"fmt"
	"os"
	"os/exec"
	"path/filepath"
	"strings"
	"time"
)

func Clean(repoPath string, expirationDays time.Duration, dryRun bool) error {
	allWorktreePaths, err := getWorktrees(repoPath)
	if err != nil {
		return err
	}

	expiration := time.Now().Add(-expirationDays * 24 * time.Hour)
	filteredWorktreePaths := []string{}
	for _, worktreePath := range allWorktreePaths {
		isMainWorktree := isMain(repoPath, worktreePath)
		isExpired, err := isPastExpiration(worktreePath, expiration)
		if err != nil {
			return err
		}

		if !isMainWorktree && isExpired {
			filteredWorktreePaths = append(filteredWorktreePaths, worktreePath)
		}
	}

	if !dryRun {
		removeWorktrees(repoPath, filteredWorktreePaths)
	} else {
		fmt.Printf("Worktrees to remove: %s\n", filteredWorktreePaths)
	}

	return nil
}

func getWorktrees(repoPath string) ([]string, error) {
	allWorktreePaths := []string{}
	cmd := exec.Command("git", "worktree", "list", "--porcelain")
	cmd.Dir = repoPath

	stdout, err := cmd.StdoutPipe()
	if err != nil {
		return allWorktreePaths, err
	}

	scanner := bufio.NewScanner(stdout)

	if err = cmd.Start(); err != nil {
		return allWorktreePaths, err
	}

	for scanner.Scan() {
		line := scanner.Text()
		if strings.HasPrefix(line, "worktree ") {
			worktreePath := strings.Split(line, " ")[1]
			allWorktreePaths = append(allWorktreePaths, worktreePath)
		}
	}

	if err = scanner.Err(); err != nil {
		return allWorktreePaths, err
	}

	err = cmd.Wait()
	return allWorktreePaths, err
}

func isMain(repoPath string, worktreePath string) bool {
	return filepath.Clean(repoPath) == filepath.Clean(worktreePath)
}

func isPastExpiration(worktreePath string, expiration time.Time) (bool, error) {
	fileInfo, err := os.Stat(worktreePath)
	if err != nil {
		return false, err
	}

	lastModified := fileInfo.ModTime()
	return lastModified.Before(expiration), nil
}

func removeWorktrees(repoPath string, worktreePaths []string) error {
	for _, worktreePath := range worktreePaths {
		if err := removeWorktree(repoPath, worktreePath); err != nil {
			return err
		}
	}

	return nil
}

func removeWorktree(repoPath string, worktreePath string) error {
	splitWorktreePath := strings.Split(worktreePath, string(os.PathSeparator))
	worktreeName := splitWorktreePath[len(splitWorktreePath)-1]

	cmd := exec.Command("git", "worktree", "remove", worktreeName, "--force")
	cmd.Dir = repoPath

	return cmd.Run()
}
