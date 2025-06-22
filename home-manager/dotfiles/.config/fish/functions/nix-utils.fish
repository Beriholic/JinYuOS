function nix-utils --description "A Nix utility wrapper for common profile/run/shell commands"
    if test -z "$argv[1]"
        __nix_util_help
        return 1
    end

    set -l subcommand $argv[1]
    set -l args $argv[2..]

    switch $subcommand
        case install
            if test -z "$args"
                echo "Usage: nix-utils install <package1> [package2...]" >&2
                return 1
            end
            set -l processed_args
            for arg in $args
                set -a processed_args "nixpkgs#$arg"
            end
            command nix profile install $processed_args

        case list
            command nix profile list

        case remove
            if test -z "$args"
                echo "Usage: nix-utils remove <package1> [package2...]" >&2
                return 1
            end
            command nix profile remove $args

        case run
            if test -z "$args"
                echo "Usage: nix-utils run <package> -- [args_for_program...]" >&2
                return 1
            end
            set -l package "nixpkgs#$args[1]"
            set -l program_args $args[2..]
            command nix run $package -- $program_args

        case shell shellf
            if test -z "$args"
                command nix shell --command fish
            else
                set -l processed_args
                for arg in $args
                    set -a processed_args "nixpkgs#$arg"
                end
                command nix shell $processed_args --command fish
            end

        case help -h --help
            __nix_util_help

        case '*'
            echo "Error: Unknown subcommand '$subcommand'." >&2
            __nix_util_help
            return 1
    end
end

function __nix_util_help
    echo "A Nix utility wrapper for common commands."
    echo
    echo "USAGE:"
    echo "  nix-utilss <subcommand> [arguments...]"
    echo
    echo "SUBCOMMANDS:"
    echo "  install <pkg...>" -d "Install packages to your profile (e.g., nix-utils install ripgrep fd)"
    echo "  list"             -d "List installed packages in your profile"
    echo "  remove <pkg...>"  -d "Remove packages from your profile (e.g., nix-utils remove ripgrep)"
    echo "  run <pkg> -- [args...]" -d "Run a command from a package (e.g., nix-utils run cowsay -- 'Hello Fish')"
    echo "  shell [pkg...]"   -d "Start a fish shell with temporary packages (e.g., nix-utils shell go nodejs)"
    echo "  help"             -d "Show this help message"
end
