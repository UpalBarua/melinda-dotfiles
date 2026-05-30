{ config, pkgs, ...}:

{
	home.username = "upal";
	home.homeDirectory = "/home/upal";
	home.stateVersion = "25.05";

	programs.bash = {
		enable = true;
		shellAliases = {
			btw = "echo I use nixos btw";
		};
	};
}
