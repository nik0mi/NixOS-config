{ config, pkgs, inputs, lib, ... } :

{
  programs.vscode = {
    enable = true;
    profiles.default.userSettings = lib.mkForce{
        "editor.fontFamily" = "'JetBrainsMono Nerd Font', 'semibold', semibold";
        "editor.fontSize" = 13;
        "editor.fontLigatures" = true;
        
        "workbench.tree.indent" = 14;
        
        "editor.lineNumbers" = "on";
        
        "explorer.confirmDragAndDrop" = true;
        "explorer.confirmDelete" = true;
        
        "workbench.sideBar.location" = "right";
        
        "excalidraw.workspaceLibraryPath" = ".";
        "excalidraw.theme" = "dark";
        
        "editor.scrollbar.vertical" = "hidden";
        "editor.minimap.enabled" = true;
        "editor.minimap.side" = "left";
        "editor.matchBrackets" = "always";
        "editor.occurrencesHighlight" = "singleFile";
        "editor.overviewRulerBorder" = true;
        "editor.hideCursorInOverviewRuler" = true;
        "editor.stickyScroll.enabled" = false;
        "workbench.colorCustomizations" = {
            "editorCursor.background" = "#000000";
            "editorOverviewRuler.wordHighlightStrongForeground" = "#0000";
            "editorOverviewRuler.selectionHighlightForeground" = "#0000";
            "editorOverviewRuler.rangeHighlightForeground" = "#0000";
            "editorOverviewRuler.wordHighlightForeground" = "#0000";
            "editorOverviewRuler.bracketMatchForeground" = "#0000";
            "editorOverviewRuler.findMatchForeground" = "#0000";
            "editorOverviewRuler.modifiedForeground" = "#0000";
            "editorOverviewRuler.deletedForeground" = "#0000";
            "editorOverviewRuler.warningForeground" = "#0000";
            "editorOverviewRuler.addedForeground" = "#0000";
            "editorOverviewRuler.errorForeground" = "#0000";
            "editorOverviewRuler.infoForeground" = "#0000";
            "editorOverviewRuler.border" = "#0000";
        };
        
        "breadcrumbs.enabled" = false;
        
        "workbench.statusBar.visible" = false;
        
        "workbench.activityBar.location" = "hidden";
        
        "window.zoomLevel" = 1;
        
        "editor.multiCursorModifier" = "ctrlCmd";
        "editor.cursorBlinking" = "solid";
        
        "chat.commandCenter.enabled" = false;
        "workbench.layoutControl.enabled" = false;
        "window.customTitleBarVisibility" = "never";
        "window.titleBarStyle" = "native";
        "window.menuBarVisibility" = "toggle";
        
        "explorer.decorations.badges" = false;
        "git.decorations.enabled" = false;
        "scm.diffDecorations" = "none";
        
        "todohighlight.isEnable" = true;
        
        "workbench.startupEditor" = "none";
        
        "editor.tabSize" = 4;
        
        "files.insertFinalNewline" = true;
        
        "workbench.tips.enabled" = false;
        
        "workbench.tree.enableStickyScroll" = false;
        
        "workbench.tree.renderIndentGuides" = "none";
        
        "editor.detectIndentation" = true;
        
        "editor.renderLineHighlight" = "none";
        
        "files.autoSave" = "afterDelay";
        
        "update.mode" = "none";
        
        "workbench.colorTheme" = "Steam Classic";
        "extensions.ignoreRecommendations" = true;
        "security.workspace.trust.untrustedFiles" = "open";
        "workbench.secondarySideBar.defaultVisibility" = "hidden";

        #ONLY FOR NIX
        "nix.serverPath" = "nixd";
        "nix.enableLanguageServer" = true;
        "nix.serverSettings" = {
            "nixd" = {
              "formatting" = {
                  "command" = [ "alejandra" ];
              };
              "options" = {
                  "nixos" = {
                    "expr" = "(builtins.getFlake \"../flake.nix\").nixosConfigurations.ovce.options";
                  };
                  "home_manager" = {
                    "expr" = "(builtins.getFlake \"../flake.nix\").homeConfigurations.ovce.options";
                  };
              };
            };
        };
    };
  };
}
