function sdInstall

    fprintf('Installing SurfDirectory...\n');

    % --- Moving the main script to the user path ---
    ROOT_FOLDER = pwd;
    copyfile(fullfile(ROOT_FOLDER, "sd.m"), userpath)
    fprintf('  Copied sd.m to %s\n', userpath);

    % --- Create the initial function signatures with the built-in functions ---
    updateFunctionSignatures()
    if ~exist(fullfile(userpath, "resources"), "dir")
        mkdir(fullfile(userpath, "resources"))
    end
    copyfile(fullfile(ROOT_FOLDER, "resources", "functionSignatures.json"), fullfile(userpath, "resources"))
    fprintf('  Installed function signatures.\n');

    % Load files if files.mat exists
    if exist("files.mat","file") == 2
        sd files load
        fprintf('  Loaded file entries from files.mat.\n');
    end

    % Load bookmarks if bookmarks.mat exists
    if exist("bookmarks.mat","file") == 2
        sd book load
        fprintf('  Loaded bookmarks from bookmarks.mat.\n');
    end

    fprintf('<strong>Done.</strong> Restart MATLAB or run `rehash toolboxcache`.\n');
end
