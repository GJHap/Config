{ }:
let usernameEnv = builtins.getEnv "USERNAME";
in if usernameEnv == "" then "ghapgood" else usernameEnv
