{ lib, config, pkgs, ... }:

{
	services.auto-cpufreq.enable = true;
	services.auto-cpufreq.settings = {
		battery = {
			governor = "powersave";
			turbo = "never";
		};
		charger = {
			governor = "powersave";
			turbo = "never";
		};
	};
}
