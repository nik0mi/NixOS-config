{ lib, ... }:

{
  programs.vscode = {
    enable = true;

        profiles.default.userSettings = lib.mkForce {
           "breadcrumbs.enabled" =  false;
      "chat.commandCenter.enabled" =  false;
      "editor.cursorBlinking" =  "solid";
      "editor.detectIndentation" =  true;
      "editor.fontFamily" =  "'JetBrainsMono Nerd Font', 'semibold', semibold";
      "editor.fontLigatures" =  true;
      "editor.fontSize" =  13;
      "editor.hideCursorInOverviewRuler" =  true;
      "editor.lineNumbers" =  "on";
      "editor.matchBrackets" =  "always";
      "editor.minimap.enabled" =  true;
      "editor.minimap.side" =  "left";
      "editor.multiCursorModifier" =  "ctrlCmd";
      "editor.occurrencesHighlight" =  "singleFile";
      "editor.overviewRulerBorder" =  true;
      "editor.renderLineHighlight" =  "none";
      "editor.scrollbar.vertical" =  "hidden";
      "editor.stickyScroll.enabled" =  false;
      "editor.tabSize" =  4;
      "explorer.confirmDelete" =  true;
      "explorer.confirmDragAndDrop" =  true;
      "explorer.decorations.badges" =  false;
      "extensions.ignoreRecommendations" =  true;
      "files.autoSave" =  "afterDelay";
      "files.insertFinalNewline" =  true;
      "git.decorations.enabled" =  false;
      "scm.diffDecorations" =  "none";
      "update.mode" =  "none";
      "window.customTitleBarVisibility" =  "never";
      "window.menuBarVisibility" =  "toggle";
      "window.titleBarStyle" =  "native";
      "window.zoomLevel" =  1;
      "workbench.activityBar.location" =  "hidden";
      "workbench.colorCustomizations" = {
        "editorCursor.background" =  "#000000";
        "editorOverviewRuler.addedForeground" =  "#0000";
        "editorOverviewRuler.border" =  "#0000";
        "editorOverviewRuler.bracketMatchForeground" =  "#0000";
        "editorOverviewRuler.deletedForeground" =  "#0000";
        "editorOverviewRuler.errorForeground" =  "#0000";
        "editorOverviewRuler.findMatchForeground" =  "#0000";
        "editorOverviewRuler.infoForeground" =  "#0000";
        "editorOverviewRuler.modifiedForeground" =  "#0000";
        "editorOverviewRuler.rangeHighlightForeground" =  "#0000";
        "editorOverviewRuler.selectionHighlightForeground" =  "#0000";
        "editorOverviewRuler.warningForeground" =  "#0000";
        "editorOverviewRuler.wordHighlightForeground" =  "#0000";
        "editorOverviewRuler.wordHighlightStrongForeground" =  "#0000";
      };
      "workbench.layoutControl.enabled" =  false;
      "workbench.sideBar.location" =  "right";
      "workbench.startupEditor" =  "none";
      "workbench.statusBar.visible" =  false;
      "workbench.tips.enabled" =  false;
      "workbench.tree.enableStickyScroll" =  false;
      "workbench.tree.indent" =  14;
      "workbench.tree.renderIndentGuides" =  "none";
      "workbench.colorTheme" =  "Everforest Dark";
    };
  };
}
