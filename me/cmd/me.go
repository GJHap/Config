package cmd

import (
	"fmt"
	"github.com/GJHap/me/cmd/subcmd"
	"github.com/spf13/cobra"
	"os"
)

func Run() {
	command := getCommand()

	if err := command.Execute(); err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}

func getCommand() *cobra.Command {
	command := &cobra.Command{
		Use: "me",
	}

	command.AddCommand(subcmd.SubCommands()...)
	return command
}
