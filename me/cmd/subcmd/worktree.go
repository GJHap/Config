package subcmd

import (
	"path"
	"strconv"
	"time"

	"github.com/GJHap/me/pkg/worktree"
	"github.com/spf13/cobra"
)

func WorktreeCommand(repoPath string, links worktree.WorktreeLinks) *cobra.Command {
	worktreeCommand := &cobra.Command{
		Use: "worktree",
	}
	worktreeCommand.AddCommand(addCommand(repoPath, links))
	worktreeCommand.AddCommand(cleanCommand(repoPath))

	return worktreeCommand
}

func addCommand(repoPath string, links worktree.WorktreeLinks) *cobra.Command {
	addCommand := &cobra.Command{
		Use:  "add [string]",
		Args: cobra.ExactArgs(1),
		RunE: func(cmd *cobra.Command, args []string) error {
			worktreeName := args[0]
			worktreePath := path.Join(repoPath, "..", worktreeName)

			return worktree.Add(repoPath, worktreePath, links)
		},
	}

	return addCommand
}

func cleanCommand(repoPath string) *cobra.Command {
	dryRun := false
	cleanCommand := &cobra.Command{
		Use:  "clean <expirationDays>",
		Args: cobra.ExactArgs(1),
		RunE: func(cmd *cobra.Command, args []string) error {
			expirationDays, err := strconv.Atoi(args[0])
			if err != nil {
				return err
			}

			return worktree.Clean(repoPath, time.Duration(expirationDays), dryRun)
		},
	}

	cleanCommand.Flags().BoolVar(&dryRun, "dryRun", false, "Perform a trial run")
	return cleanCommand
}
